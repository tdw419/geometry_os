; DESCRIPTION: Places a white line segment connecting (241, 131) to (490, 159).
; PLAN: r0=241(x1), r1=131(y1), r2=490(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 131
LDI r2, 490
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
