; DESCRIPTION: Places a orange line segment connecting (112, 30) to (274, 116).
; PLAN: r0=112(x1), r1=30(y1), r2=274(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 30
LDI r2, 274
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
