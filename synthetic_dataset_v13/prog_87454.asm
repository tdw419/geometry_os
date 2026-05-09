; DESCRIPTION: Renders a blue line between points (26, 3) and (441, 130).
; PLAN: r0=26(x1), r1=3(y1), r2=441(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 3
LDI r2, 441
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
