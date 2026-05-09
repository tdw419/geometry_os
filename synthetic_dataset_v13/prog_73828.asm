; DESCRIPTION: Places a green line segment connecting (33, 6) to (329, 224).
; PLAN: r0=33(x1), r1=6(y1), r2=329(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 6
LDI r2, 329
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
