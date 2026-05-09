; DESCRIPTION: Places a red line segment connecting (181, 240) to (343, 203).
; PLAN: r0=181(x1), r1=240(y1), r2=343(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 240
LDI r2, 343
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
