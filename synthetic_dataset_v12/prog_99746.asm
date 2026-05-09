; DESCRIPTION: Renders a blue line between points (190, 154) and (194, 194).
; PLAN: r0=190(x1), r1=154(y1), r2=194(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 154
LDI r2, 194
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
