; DESCRIPTION: Renders a blue line between points (460, 192) and (141, 194).
; PLAN: r0=460(x1), r1=192(y1), r2=141(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 192
LDI r2, 141
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
