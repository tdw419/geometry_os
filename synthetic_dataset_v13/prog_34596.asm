; DESCRIPTION: Draws a magenta line from (93, 61) to (441, 141).
; PLAN: r0=93(x1), r1=61(y1), r2=441(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 61
LDI r2, 441
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
