; DESCRIPTION: Draws a magenta line from (8, 21) to (204, 201).
; PLAN: r0=8(x1), r1=21(y1), r2=204(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 21
LDI r2, 204
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
