; DESCRIPTION: Places a green line segment connecting (167, 113) to (427, 201).
; PLAN: r0=167(x1), r1=113(y1), r2=427(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 113
LDI r2, 427
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
