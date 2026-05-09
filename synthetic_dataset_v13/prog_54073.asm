; DESCRIPTION: Places a black line segment connecting (366, 185) to (253, 235).
; PLAN: r0=366(x1), r1=185(y1), r2=253(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 185
LDI r2, 253
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
