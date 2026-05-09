; DESCRIPTION: Places a magenta line segment connecting (308, 224) to (299, 157).
; PLAN: r0=308(x1), r1=224(y1), r2=299(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 224
LDI r2, 299
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
