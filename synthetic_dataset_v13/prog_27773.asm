; DESCRIPTION: Renders a magenta line between points (139, 120) and (204, 33).
; PLAN: r0=139(x1), r1=120(y1), r2=204(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 120
LDI r2, 204
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
