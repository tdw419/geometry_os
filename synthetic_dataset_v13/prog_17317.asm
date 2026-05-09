; DESCRIPTION: Renders a blue line between points (132, 243) and (326, 139).
; PLAN: r0=132(x1), r1=243(y1), r2=326(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 243
LDI r2, 326
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
