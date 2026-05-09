; DESCRIPTION: Places a orange line segment connecting (270, 183) to (414, 235).
; PLAN: r0=270(x1), r1=183(y1), r2=414(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 183
LDI r2, 414
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
