; DESCRIPTION: Renders a purple line between points (71, 243) and (302, 197).
; PLAN: r0=71(x1), r1=243(y1), r2=302(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 243
LDI r2, 302
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
