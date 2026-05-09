; DESCRIPTION: Renders a orange line between points (167, 84) and (360, 152).
; PLAN: r0=167(x1), r1=84(y1), r2=360(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 84
LDI r2, 360
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
