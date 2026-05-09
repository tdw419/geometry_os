; DESCRIPTION: Places a orange line segment connecting (226, 73) to (360, 224).
; PLAN: r0=226(x1), r1=73(y1), r2=360(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 73
LDI r2, 360
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
