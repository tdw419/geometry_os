; DESCRIPTION: Places a orange line segment connecting (186, 74) to (112, 36).
; PLAN: r0=186(x1), r1=74(y1), r2=112(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 74
LDI r2, 112
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
