; DESCRIPTION: Renders a blue line between points (76, 77) and (490, 190).
; PLAN: r0=76(x1), r1=77(y1), r2=490(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 77
LDI r2, 490
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
