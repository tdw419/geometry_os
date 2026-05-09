; DESCRIPTION: Draws a magenta line from (414, 23) to (251, 184).
; PLAN: r0=414(x1), r1=23(y1), r2=251(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 23
LDI r2, 251
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
