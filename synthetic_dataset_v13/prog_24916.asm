; DESCRIPTION: Draws a black line from (275, 6) to (122, 246).
; PLAN: r0=275(x1), r1=6(y1), r2=122(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 6
LDI r2, 122
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
