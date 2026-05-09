; DESCRIPTION: Places a red line segment connecting (252, 56) to (135, 224).
; PLAN: r0=252(x1), r1=56(y1), r2=135(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 56
LDI r2, 135
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
