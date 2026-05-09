; DESCRIPTION: Renders a purple line between points (73, 146) and (449, 104).
; PLAN: r0=73(x1), r1=146(y1), r2=449(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 146
LDI r2, 449
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
