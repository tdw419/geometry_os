; DESCRIPTION: Renders a blue line between points (437, 88) and (43, 177).
; PLAN: r0=437(x1), r1=88(y1), r2=43(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 88
LDI r2, 43
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
