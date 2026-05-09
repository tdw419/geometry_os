; DESCRIPTION: Places a yellow line segment connecting (498, 147) to (44, 254).
; PLAN: r0=498(x1), r1=147(y1), r2=44(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 147
LDI r2, 44
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
