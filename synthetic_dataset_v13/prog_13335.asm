; DESCRIPTION: Places a red line segment connecting (159, 18) to (155, 1).
; PLAN: r0=159(x1), r1=18(y1), r2=155(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 18
LDI r2, 155
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
