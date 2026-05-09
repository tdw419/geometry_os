; DESCRIPTION: Renders a magenta line between points (176, 139) and (45, 5).
; PLAN: r0=176(x1), r1=139(y1), r2=45(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 139
LDI r2, 45
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
