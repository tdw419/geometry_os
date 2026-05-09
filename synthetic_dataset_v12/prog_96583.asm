; DESCRIPTION: Places a red line segment connecting (30, 136) to (253, 252).
; PLAN: r0=30(x1), r1=136(y1), r2=253(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 136
LDI r2, 253
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
