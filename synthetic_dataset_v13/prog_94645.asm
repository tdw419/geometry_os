; DESCRIPTION: Places a white line segment connecting (69, 99) to (326, 224).
; PLAN: r0=69(x1), r1=99(y1), r2=326(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 99
LDI r2, 326
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
