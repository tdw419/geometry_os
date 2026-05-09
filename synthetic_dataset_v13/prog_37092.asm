; DESCRIPTION: Draws a black line from (88, 81) to (111, 157).
; PLAN: r0=88(x1), r1=81(y1), r2=111(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 81
LDI r2, 111
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
