; DESCRIPTION: Places a green line segment connecting (271, 196) to (303, 224).
; PLAN: r0=271(x1), r1=196(y1), r2=303(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 196
LDI r2, 303
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
