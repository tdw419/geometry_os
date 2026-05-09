; DESCRIPTION: Places a orange line segment connecting (113, 175) to (271, 224).
; PLAN: r0=113(x1), r1=175(y1), r2=271(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 175
LDI r2, 271
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
