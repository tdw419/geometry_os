; DESCRIPTION: Places a magenta line segment connecting (343, 113) to (93, 99).
; PLAN: r0=343(x1), r1=113(y1), r2=93(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 113
LDI r2, 93
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
