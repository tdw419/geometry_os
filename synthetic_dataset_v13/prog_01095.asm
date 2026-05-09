; DESCRIPTION: Renders a black line between points (390, 237) and (463, 72).
; PLAN: r0=390(x1), r1=237(y1), r2=463(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 237
LDI r2, 463
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
