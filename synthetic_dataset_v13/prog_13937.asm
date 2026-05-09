; DESCRIPTION: Draws a magenta line from (227, 245) to (431, 115).
; PLAN: r0=227(x1), r1=245(y1), r2=431(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 245
LDI r2, 431
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
