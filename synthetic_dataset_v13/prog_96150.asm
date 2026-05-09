; DESCRIPTION: Places a orange line segment connecting (439, 113) to (158, 182).
; PLAN: r0=439(x1), r1=113(y1), r2=158(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 113
LDI r2, 158
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
