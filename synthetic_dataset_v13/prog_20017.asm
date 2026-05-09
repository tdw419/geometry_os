; DESCRIPTION: Places a yellow line segment connecting (360, 224) to (375, 248).
; PLAN: r0=360(x1), r1=224(y1), r2=375(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 224
LDI r2, 375
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
