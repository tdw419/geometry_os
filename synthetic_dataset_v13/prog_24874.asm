; DESCRIPTION: Renders a blue line between points (393, 225) and (190, 94).
; PLAN: r0=393(x1), r1=225(y1), r2=190(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 225
LDI r2, 190
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
