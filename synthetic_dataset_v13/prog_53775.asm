; DESCRIPTION: Renders a blue line between points (68, 6) and (75, 35).
; PLAN: r0=68(x1), r1=6(y1), r2=75(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 6
LDI r2, 75
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
