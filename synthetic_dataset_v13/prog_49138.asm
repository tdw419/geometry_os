; DESCRIPTION: Renders a blue line between points (463, 161) and (67, 217).
; PLAN: r0=463(x1), r1=161(y1), r2=67(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 161
LDI r2, 67
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
