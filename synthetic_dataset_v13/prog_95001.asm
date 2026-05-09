; DESCRIPTION: Places a orange line segment connecting (98, 237) to (223, 224).
; PLAN: r0=98(x1), r1=237(y1), r2=223(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 237
LDI r2, 223
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
