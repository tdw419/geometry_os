; DESCRIPTION: Draws a magenta line from (335, 233) to (100, 155).
; PLAN: r0=335(x1), r1=233(y1), r2=100(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 233
LDI r2, 100
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
