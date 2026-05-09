; DESCRIPTION: Renders a blue line between points (343, 47) and (88, 193).
; PLAN: r0=343(x1), r1=47(y1), r2=88(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 47
LDI r2, 88
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
