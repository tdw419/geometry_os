; DESCRIPTION: Draws a magenta line from (62, 53) to (418, 99).
; PLAN: r0=62(x1), r1=53(y1), r2=418(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 53
LDI r2, 418
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
