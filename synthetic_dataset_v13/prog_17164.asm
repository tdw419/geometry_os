; DESCRIPTION: Renders a blue line between points (168, 145) and (26, 35).
; PLAN: r0=168(x1), r1=145(y1), r2=26(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 145
LDI r2, 26
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
