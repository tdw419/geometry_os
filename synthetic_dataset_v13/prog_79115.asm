; DESCRIPTION: Places a red line segment connecting (86, 101) to (283, 179).
; PLAN: r0=86(x1), r1=101(y1), r2=283(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 101
LDI r2, 283
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
