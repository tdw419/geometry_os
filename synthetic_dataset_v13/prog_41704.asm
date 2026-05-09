; DESCRIPTION: Renders a blue line between points (377, 228) and (378, 205).
; PLAN: r0=377(x1), r1=228(y1), r2=378(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 228
LDI r2, 378
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
