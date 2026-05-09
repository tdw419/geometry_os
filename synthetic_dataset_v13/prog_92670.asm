; DESCRIPTION: Draws a magenta line from (473, 31) to (335, 141).
; PLAN: r0=473(x1), r1=31(y1), r2=335(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 31
LDI r2, 335
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
