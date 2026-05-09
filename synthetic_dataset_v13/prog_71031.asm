; DESCRIPTION: Places a green line segment connecting (271, 0) to (224, 218).
; PLAN: r0=271(x1), r1=0(y1), r2=224(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 0
LDI r2, 224
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
