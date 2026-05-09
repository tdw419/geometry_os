; DESCRIPTION: Places a blue line segment connecting (115, 79) to (343, 102).
; PLAN: r0=115(x1), r1=79(y1), r2=343(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 79
LDI r2, 343
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
