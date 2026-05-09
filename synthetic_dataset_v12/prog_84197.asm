; DESCRIPTION: Renders a blue line between points (112, 47) and (85, 222).
; PLAN: r0=112(x1), r1=47(y1), r2=85(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 47
LDI r2, 85
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
