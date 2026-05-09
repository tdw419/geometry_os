; DESCRIPTION: Renders a purple line between points (70, 93) and (456, 167).
; PLAN: r0=70(x1), r1=93(y1), r2=456(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 93
LDI r2, 456
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
