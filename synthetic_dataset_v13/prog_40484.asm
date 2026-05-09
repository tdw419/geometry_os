; DESCRIPTION: Places a yellow line segment connecting (54, 62) to (270, 201).
; PLAN: r0=54(x1), r1=62(y1), r2=270(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 62
LDI r2, 270
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
