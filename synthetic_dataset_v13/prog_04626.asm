; DESCRIPTION: Renders a magenta line between points (221, 140) and (94, 79).
; PLAN: r0=221(x1), r1=140(y1), r2=94(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 140
LDI r2, 94
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
