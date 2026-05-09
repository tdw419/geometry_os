; DESCRIPTION: Places a magenta line segment connecting (348, 119) to (453, 104).
; PLAN: r0=348(x1), r1=119(y1), r2=453(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 119
LDI r2, 453
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
