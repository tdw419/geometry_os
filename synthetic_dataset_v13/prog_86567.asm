; DESCRIPTION: Places a orange line segment connecting (12, 155) to (509, 172).
; PLAN: r0=12(x1), r1=155(y1), r2=509(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 155
LDI r2, 509
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
