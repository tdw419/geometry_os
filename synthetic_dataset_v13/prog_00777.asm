; DESCRIPTION: Places a orange line segment connecting (172, 136) to (421, 235).
; PLAN: r0=172(x1), r1=136(y1), r2=421(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 136
LDI r2, 421
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
