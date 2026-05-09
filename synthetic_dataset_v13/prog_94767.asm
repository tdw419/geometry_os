; DESCRIPTION: Renders a magenta line between points (126, 127) and (467, 90).
; PLAN: r0=126(x1), r1=127(y1), r2=467(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 127
LDI r2, 467
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
