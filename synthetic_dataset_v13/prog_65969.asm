; DESCRIPTION: Places a magenta line segment connecting (85, 224) to (103, 219).
; PLAN: r0=85(x1), r1=224(y1), r2=103(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 224
LDI r2, 103
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
