; DESCRIPTION: Places a black line segment connecting (29, 60) to (181, 235).
; PLAN: r0=29(x1), r1=60(y1), r2=181(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 60
LDI r2, 181
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
