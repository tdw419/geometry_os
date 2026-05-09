; DESCRIPTION: Draws a magenta line from (467, 149) to (369, 180).
; PLAN: r0=467(x1), r1=149(y1), r2=369(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 149
LDI r2, 369
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
