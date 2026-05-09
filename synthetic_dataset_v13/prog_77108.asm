; DESCRIPTION: Renders a orange line between points (360, 176) and (179, 48).
; PLAN: r0=360(x1), r1=176(y1), r2=179(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 176
LDI r2, 179
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
