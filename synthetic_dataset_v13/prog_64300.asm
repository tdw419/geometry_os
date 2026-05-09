; DESCRIPTION: Places a orange line segment connecting (448, 186) to (191, 224).
; PLAN: r0=448(x1), r1=186(y1), r2=191(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 186
LDI r2, 191
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
