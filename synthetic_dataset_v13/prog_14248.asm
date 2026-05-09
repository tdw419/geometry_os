; DESCRIPTION: Renders a orange line between points (39, 88) and (150, 60).
; PLAN: r0=39(x1), r1=88(y1), r2=150(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 88
LDI r2, 150
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
