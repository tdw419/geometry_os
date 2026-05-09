; DESCRIPTION: Places a black line segment connecting (74, 199) to (343, 93).
; PLAN: r0=74(x1), r1=199(y1), r2=343(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 199
LDI r2, 343
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
