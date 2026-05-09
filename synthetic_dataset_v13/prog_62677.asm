; DESCRIPTION: Renders a black line between points (377, 52) and (441, 110).
; PLAN: r0=377(x1), r1=52(y1), r2=441(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 52
LDI r2, 441
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
