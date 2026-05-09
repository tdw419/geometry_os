; DESCRIPTION: Places a orange line segment connecting (96, 206) to (55, 235).
; PLAN: r0=96(x1), r1=206(y1), r2=55(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 206
LDI r2, 55
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
