; DESCRIPTION: Renders a orange line between points (113, 193) and (118, 200).
; PLAN: r0=113(x1), r1=193(y1), r2=118(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 193
LDI r2, 118
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
