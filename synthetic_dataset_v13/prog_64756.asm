; DESCRIPTION: Draws a black line from (399, 78) to (76, 185).
; PLAN: r0=399(x1), r1=78(y1), r2=76(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 78
LDI r2, 76
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
