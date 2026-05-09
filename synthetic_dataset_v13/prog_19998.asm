; DESCRIPTION: Places a yellow line segment connecting (60, 192) to (147, 59).
; PLAN: r0=60(x1), r1=192(y1), r2=147(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 192
LDI r2, 147
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
