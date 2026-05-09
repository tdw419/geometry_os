; DESCRIPTION: Places a red line segment connecting (20, 8) to (49, 199).
; PLAN: r0=20(x1), r1=8(y1), r2=49(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 8
LDI r2, 49
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
