; DESCRIPTION: Places a black line segment connecting (120, 68) to (343, 145).
; PLAN: r0=120(x1), r1=68(y1), r2=343(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 68
LDI r2, 343
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
