; DESCRIPTION: Renders a purple line between points (202, 121) and (190, 69).
; PLAN: r0=202(x1), r1=121(y1), r2=190(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 121
LDI r2, 190
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
