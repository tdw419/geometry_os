; DESCRIPTION: Renders a magenta line between points (416, 106) and (292, 155).
; PLAN: r0=416(x1), r1=106(y1), r2=292(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 106
LDI r2, 292
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
