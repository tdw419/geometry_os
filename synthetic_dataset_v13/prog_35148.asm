; DESCRIPTION: Renders a magenta line between points (361, 195) and (201, 88).
; PLAN: r0=361(x1), r1=195(y1), r2=201(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 195
LDI r2, 201
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
