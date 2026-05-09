; DESCRIPTION: Renders a yellow line between points (289, 43) and (7, 110).
; PLAN: r0=289(x1), r1=43(y1), r2=7(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 43
LDI r2, 7
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
