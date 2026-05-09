; DESCRIPTION: Renders a magenta line between points (45, 139) and (184, 163).
; PLAN: r0=45(x1), r1=139(y1), r2=184(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 139
LDI r2, 184
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
