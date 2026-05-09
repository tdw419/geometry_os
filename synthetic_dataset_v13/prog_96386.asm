; DESCRIPTION: Places a green line segment connecting (159, 88) to (343, 169).
; PLAN: r0=159(x1), r1=88(y1), r2=343(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 88
LDI r2, 343
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
