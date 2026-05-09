; DESCRIPTION: Places a orange line segment connecting (360, 134) to (235, 194).
; PLAN: r0=360(x1), r1=134(y1), r2=235(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 134
LDI r2, 235
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
