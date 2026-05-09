; DESCRIPTION: Draws a magenta line from (467, 81) to (462, 78).
; PLAN: r0=467(x1), r1=81(y1), r2=462(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 81
LDI r2, 462
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
