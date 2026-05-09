; DESCRIPTION: Places a yellow line segment connecting (201, 167) to (241, 5).
; PLAN: r0=201(x1), r1=167(y1), r2=241(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 167
LDI r2, 241
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
