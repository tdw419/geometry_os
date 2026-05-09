; DESCRIPTION: Renders a yellow line between points (204, 216) and (427, 45).
; PLAN: r0=204(x1), r1=216(y1), r2=427(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 216
LDI r2, 427
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
