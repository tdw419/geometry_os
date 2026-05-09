; DESCRIPTION: Renders a blue line between points (190, 226) and (349, 6).
; PLAN: r0=190(x1), r1=226(y1), r2=349(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 226
LDI r2, 349
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
