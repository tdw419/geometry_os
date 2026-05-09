; DESCRIPTION: Places a orange line segment connecting (28, 184) to (280, 176).
; PLAN: r0=28(x1), r1=184(y1), r2=280(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 184
LDI r2, 280
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
