; DESCRIPTION: Places a orange line segment connecting (282, 31) to (484, 235).
; PLAN: r0=282(x1), r1=31(y1), r2=484(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 31
LDI r2, 484
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
