; DESCRIPTION: Renders a magenta line between points (155, 78) and (39, 139).
; PLAN: r0=155(x1), r1=78(y1), r2=39(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 78
LDI r2, 39
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
