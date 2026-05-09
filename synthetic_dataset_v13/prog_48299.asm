; DESCRIPTION: Draws a magenta line from (252, 240) to (278, 201).
; PLAN: r0=252(x1), r1=240(y1), r2=278(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 240
LDI r2, 278
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
