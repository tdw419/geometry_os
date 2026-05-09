; DESCRIPTION: Places a orange line segment connecting (136, 235) to (269, 188).
; PLAN: r0=136(x1), r1=235(y1), r2=269(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 235
LDI r2, 269
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
