; DESCRIPTION: Renders a orange line between points (47, 118) and (135, 48).
; PLAN: r0=47(x1), r1=118(y1), r2=135(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 118
LDI r2, 135
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
