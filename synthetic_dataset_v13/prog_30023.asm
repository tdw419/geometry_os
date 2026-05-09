; DESCRIPTION: Places a orange line segment connecting (431, 185) to (329, 60).
; PLAN: r0=431(x1), r1=185(y1), r2=329(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 185
LDI r2, 329
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
