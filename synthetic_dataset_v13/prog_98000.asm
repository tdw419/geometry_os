; DESCRIPTION: Places a green line segment connecting (224, 53) to (33, 99).
; PLAN: r0=224(x1), r1=53(y1), r2=33(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 53
LDI r2, 33
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
