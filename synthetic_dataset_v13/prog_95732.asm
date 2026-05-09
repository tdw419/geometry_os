; DESCRIPTION: Places a magenta line segment connecting (353, 139) to (103, 224).
; PLAN: r0=353(x1), r1=139(y1), r2=103(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 139
LDI r2, 103
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
