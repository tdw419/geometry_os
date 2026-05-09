; DESCRIPTION: Renders a blue line between points (250, 21) and (484, 190).
; PLAN: r0=250(x1), r1=21(y1), r2=484(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 21
LDI r2, 484
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
