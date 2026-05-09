; DESCRIPTION: Renders a blue line between points (384, 243) and (93, 51).
; PLAN: r0=384(x1), r1=243(y1), r2=93(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 243
LDI r2, 93
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
