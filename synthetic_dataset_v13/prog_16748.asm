; DESCRIPTION: Renders a magenta line between points (335, 139) and (137, 104).
; PLAN: r0=335(x1), r1=139(y1), r2=137(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 139
LDI r2, 137
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
