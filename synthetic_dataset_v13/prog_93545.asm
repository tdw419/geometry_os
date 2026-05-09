; DESCRIPTION: Places a red line segment connecting (334, 100) to (160, 183).
; PLAN: r0=334(x1), r1=100(y1), r2=160(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 100
LDI r2, 160
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
