; DESCRIPTION: Places a red line segment connecting (453, 172) to (76, 218).
; PLAN: r0=453(x1), r1=172(y1), r2=76(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 172
LDI r2, 76
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
