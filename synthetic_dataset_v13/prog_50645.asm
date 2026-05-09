; DESCRIPTION: Places a purple line segment connecting (138, 16) to (55, 224).
; PLAN: r0=138(x1), r1=16(y1), r2=55(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 16
LDI r2, 55
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
