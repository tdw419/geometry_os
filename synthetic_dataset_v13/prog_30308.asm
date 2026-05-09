; DESCRIPTION: Draws a magenta line from (19, 52) to (258, 165).
; PLAN: r0=19(x1), r1=52(y1), r2=258(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 52
LDI r2, 258
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
