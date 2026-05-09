; DESCRIPTION: Renders a magenta line between points (478, 167) and (61, 94).
; PLAN: r0=478(x1), r1=167(y1), r2=61(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 167
LDI r2, 61
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
