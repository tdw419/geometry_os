; DESCRIPTION: Renders a blue line between points (112, 172) and (507, 47).
; PLAN: r0=112(x1), r1=172(y1), r2=507(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 172
LDI r2, 507
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
