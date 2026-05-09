; DESCRIPTION: Renders a magenta line between points (467, 140) and (336, 134).
; PLAN: r0=467(x1), r1=140(y1), r2=336(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 140
LDI r2, 336
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
