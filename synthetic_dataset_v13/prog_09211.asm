; DESCRIPTION: Places a yellow line segment connecting (44, 235) to (381, 136).
; PLAN: r0=44(x1), r1=235(y1), r2=381(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 235
LDI r2, 381
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
