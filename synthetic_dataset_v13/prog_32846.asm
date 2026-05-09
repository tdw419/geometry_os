; DESCRIPTION: Renders a blue line between points (66, 100) and (35, 248).
; PLAN: r0=66(x1), r1=100(y1), r2=35(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 100
LDI r2, 35
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
