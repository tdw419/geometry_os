; DESCRIPTION: Draws a black line from (324, 246) to (35, 99).
; PLAN: r0=324(x1), r1=246(y1), r2=35(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 246
LDI r2, 35
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
