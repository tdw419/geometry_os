; DESCRIPTION: Draws a magenta line from (145, 166) to (290, 218).
; PLAN: r0=145(x1), r1=166(y1), r2=290(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 166
LDI r2, 290
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
