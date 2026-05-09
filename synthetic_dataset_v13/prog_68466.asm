; DESCRIPTION: Places a red line segment connecting (85, 224) to (374, 69).
; PLAN: r0=85(x1), r1=224(y1), r2=374(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 224
LDI r2, 374
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
