; DESCRIPTION: Places a blue line segment connecting (24, 243) to (264, 139).
; PLAN: r0=24(x1), r1=243(y1), r2=264(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 243
LDI r2, 264
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
