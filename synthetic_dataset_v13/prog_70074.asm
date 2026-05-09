; DESCRIPTION: Places a orange line segment connecting (219, 178) to (66, 100).
; PLAN: r0=219(x1), r1=178(y1), r2=66(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 178
LDI r2, 66
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
