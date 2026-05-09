; DESCRIPTION: Places a yellow line segment connecting (137, 129) to (109, 211).
; PLAN: r0=137(x1), r1=129(y1), r2=109(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 129
LDI r2, 109
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
