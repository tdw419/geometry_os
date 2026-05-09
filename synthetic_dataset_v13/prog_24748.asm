; DESCRIPTION: Draws a magenta line from (321, 176) to (107, 53).
; PLAN: r0=321(x1), r1=176(y1), r2=107(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 176
LDI r2, 107
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
