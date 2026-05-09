; DESCRIPTION: Draws a magenta line from (95, 232) to (184, 201).
; PLAN: r0=95(x1), r1=232(y1), r2=184(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 232
LDI r2, 184
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
