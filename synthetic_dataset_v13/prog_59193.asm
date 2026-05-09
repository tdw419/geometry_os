; DESCRIPTION: Places a black line segment connecting (343, 97) to (304, 238).
; PLAN: r0=343(x1), r1=97(y1), r2=304(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 97
LDI r2, 304
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
