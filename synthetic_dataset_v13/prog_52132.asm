; DESCRIPTION: Places a green line segment connecting (56, 33) to (22, 224).
; PLAN: r0=56(x1), r1=33(y1), r2=22(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 33
LDI r2, 22
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
