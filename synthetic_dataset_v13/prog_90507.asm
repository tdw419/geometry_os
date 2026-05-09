; DESCRIPTION: Renders a orange line between points (252, 74) and (60, 89).
; PLAN: r0=252(x1), r1=74(y1), r2=60(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 74
LDI r2, 60
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
