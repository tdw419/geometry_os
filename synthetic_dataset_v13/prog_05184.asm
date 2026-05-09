; DESCRIPTION: Renders a blue line between points (278, 190) and (125, 114).
; PLAN: r0=278(x1), r1=190(y1), r2=125(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 190
LDI r2, 125
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
