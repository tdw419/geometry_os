; DESCRIPTION: Draws a magenta line from (275, 36) to (232, 85).
; PLAN: r0=275(x1), r1=36(y1), r2=232(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 36
LDI r2, 232
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
