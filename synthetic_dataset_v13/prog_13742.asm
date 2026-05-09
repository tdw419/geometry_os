; DESCRIPTION: Draws a magenta line from (335, 44) to (312, 216).
; PLAN: r0=335(x1), r1=44(y1), r2=312(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 44
LDI r2, 312
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
