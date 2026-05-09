; DESCRIPTION: Places a black line segment connecting (353, 235) to (496, 181).
; PLAN: r0=353(x1), r1=235(y1), r2=496(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 235
LDI r2, 496
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
