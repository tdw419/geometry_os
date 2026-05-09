; DESCRIPTION: Draws a magenta line from (18, 225) to (335, 166).
; PLAN: r0=18(x1), r1=225(y1), r2=335(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 225
LDI r2, 335
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
