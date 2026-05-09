; DESCRIPTION: Places a orange line segment connecting (443, 249) to (388, 224).
; PLAN: r0=443(x1), r1=249(y1), r2=388(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 249
LDI r2, 388
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
