; DESCRIPTION: Renders a blue line between points (249, 160) and (498, 190).
; PLAN: r0=249(x1), r1=160(y1), r2=498(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 160
LDI r2, 498
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
