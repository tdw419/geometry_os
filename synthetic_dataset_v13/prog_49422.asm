; DESCRIPTION: Renders a purple line between points (262, 243) and (49, 140).
; PLAN: r0=262(x1), r1=243(y1), r2=49(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 243
LDI r2, 49
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
