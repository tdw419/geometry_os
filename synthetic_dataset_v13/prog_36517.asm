; DESCRIPTION: Draws a magenta line from (227, 116) to (201, 222).
; PLAN: r0=227(x1), r1=116(y1), r2=201(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 116
LDI r2, 201
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
