; DESCRIPTION: Renders a magenta line between points (50, 93) and (361, 140).
; PLAN: r0=50(x1), r1=93(y1), r2=361(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 93
LDI r2, 361
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
