; DESCRIPTION: Renders a blue line between points (194, 47) and (132, 225).
; PLAN: r0=194(x1), r1=47(y1), r2=132(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 47
LDI r2, 132
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
