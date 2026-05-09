; DESCRIPTION: Renders a purple line between points (305, 134) and (35, 118).
; PLAN: r0=305(x1), r1=134(y1), r2=35(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 134
LDI r2, 35
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
