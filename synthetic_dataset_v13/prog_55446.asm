; DESCRIPTION: Renders a blue line between points (59, 117) and (318, 141).
; PLAN: r0=59(x1), r1=117(y1), r2=318(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 117
LDI r2, 318
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
