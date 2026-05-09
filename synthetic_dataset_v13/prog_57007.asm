; DESCRIPTION: Renders a magenta line between points (437, 63) and (93, 103).
; PLAN: r0=437(x1), r1=63(y1), r2=93(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 63
LDI r2, 93
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
