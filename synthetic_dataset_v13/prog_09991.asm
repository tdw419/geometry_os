; DESCRIPTION: Places a red line segment connecting (491, 118) to (32, 252).
; PLAN: r0=491(x1), r1=118(y1), r2=32(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 118
LDI r2, 32
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
