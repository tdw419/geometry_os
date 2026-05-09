; DESCRIPTION: Places a red line segment connecting (490, 201) to (173, 72).
; PLAN: r0=490(x1), r1=201(y1), r2=173(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 201
LDI r2, 173
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
