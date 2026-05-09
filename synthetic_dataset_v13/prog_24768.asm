; DESCRIPTION: Renders a black line between points (105, 85) and (222, 181).
; PLAN: r0=105(x1), r1=85(y1), r2=222(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 85
LDI r2, 222
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
