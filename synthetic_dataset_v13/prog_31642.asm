; DESCRIPTION: Renders a orange line between points (413, 94) and (505, 34).
; PLAN: r0=413(x1), r1=94(y1), r2=505(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 94
LDI r2, 505
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
