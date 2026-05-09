; DESCRIPTION: Renders a blue line between points (500, 50) and (172, 194).
; PLAN: r0=500(x1), r1=50(y1), r2=172(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 50
LDI r2, 172
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
