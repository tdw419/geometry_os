; DESCRIPTION: Places a yellow line segment connecting (123, 68) to (314, 224).
; PLAN: r0=123(x1), r1=68(y1), r2=314(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 68
LDI r2, 314
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
