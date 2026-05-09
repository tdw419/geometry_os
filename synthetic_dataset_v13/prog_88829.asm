; DESCRIPTION: Places a green line segment connecting (117, 244) to (271, 224).
; PLAN: r0=117(x1), r1=244(y1), r2=271(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 244
LDI r2, 271
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
