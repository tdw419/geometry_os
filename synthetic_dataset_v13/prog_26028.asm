; DESCRIPTION: Draws a blue line from (53, 243) to (466, 139).
; PLAN: r0=53(x1), r1=243(y1), r2=466(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 243
LDI r2, 466
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
