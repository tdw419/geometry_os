; DESCRIPTION: Renders a yellow line between points (191, 139) and (464, 147).
; PLAN: r0=191(x1), r1=139(y1), r2=464(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 139
LDI r2, 464
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
