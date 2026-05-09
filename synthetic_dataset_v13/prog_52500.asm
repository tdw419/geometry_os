; DESCRIPTION: Renders a yellow line between points (441, 219) and (62, 104).
; PLAN: r0=441(x1), r1=219(y1), r2=62(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 219
LDI r2, 62
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
