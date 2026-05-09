; DESCRIPTION: Places a orange line segment connecting (10, 225) to (224, 134).
; PLAN: r0=10(x1), r1=225(y1), r2=224(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 225
LDI r2, 224
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
