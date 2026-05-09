; DESCRIPTION: Renders a blue line between points (389, 174) and (85, 20).
; PLAN: r0=389(x1), r1=174(y1), r2=85(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 174
LDI r2, 85
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
