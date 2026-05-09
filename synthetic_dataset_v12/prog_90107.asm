; DESCRIPTION: Places a purple line segment connecting (224, 85) to (495, 64).
; PLAN: r0=224(x1), r1=85(y1), r2=495(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 85
LDI r2, 495
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
