; DESCRIPTION: Renders a orange line between points (199, 158) and (180, 48).
; PLAN: r0=199(x1), r1=158(y1), r2=180(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 158
LDI r2, 180
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
