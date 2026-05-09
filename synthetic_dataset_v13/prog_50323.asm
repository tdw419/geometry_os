; DESCRIPTION: Renders a yellow line between points (441, 40) and (451, 211).
; PLAN: r0=441(x1), r1=40(y1), r2=451(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 40
LDI r2, 451
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
