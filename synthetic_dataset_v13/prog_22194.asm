; DESCRIPTION: Places a red line segment connecting (192, 233) to (172, 78).
; PLAN: r0=192(x1), r1=233(y1), r2=172(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 233
LDI r2, 172
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
