; DESCRIPTION: Places a orange line segment connecting (26, 235) to (37, 216).
; PLAN: r0=26(x1), r1=235(y1), r2=37(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 235
LDI r2, 37
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
