; DESCRIPTION: Places a red line segment connecting (40, 2) to (159, 176).
; PLAN: r0=40(x1), r1=2(y1), r2=159(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 2
LDI r2, 159
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
