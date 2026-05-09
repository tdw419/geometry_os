; DESCRIPTION: Draws a magenta line from (70, 5) to (335, 183).
; PLAN: r0=70(x1), r1=5(y1), r2=335(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 5
LDI r2, 335
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
