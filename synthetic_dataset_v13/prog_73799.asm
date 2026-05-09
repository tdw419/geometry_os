; DESCRIPTION: Places a purple line segment connecting (343, 159) to (421, 91).
; PLAN: r0=343(x1), r1=159(y1), r2=421(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 159
LDI r2, 421
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
