; DESCRIPTION: Places a orange line segment connecting (113, 110) to (253, 85).
; PLAN: r0=113(x1), r1=110(y1), r2=253(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 110
LDI r2, 253
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
