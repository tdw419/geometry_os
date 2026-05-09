; DESCRIPTION: Places a green line segment connecting (414, 196) to (120, 224).
; PLAN: r0=414(x1), r1=196(y1), r2=120(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 196
LDI r2, 120
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
