; DESCRIPTION: Places a magenta line segment connecting (86, 155) to (136, 139).
; PLAN: r0=86(x1), r1=155(y1), r2=136(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 155
LDI r2, 136
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
