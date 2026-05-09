; DESCRIPTION: Renders a purple line between points (53, 243) and (57, 100).
; PLAN: r0=53(x1), r1=243(y1), r2=57(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 243
LDI r2, 57
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
