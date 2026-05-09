; DESCRIPTION: Renders a blue line between points (114, 190) and (31, 83).
; PLAN: r0=114(x1), r1=190(y1), r2=31(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 190
LDI r2, 31
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
