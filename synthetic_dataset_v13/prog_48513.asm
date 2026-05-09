; DESCRIPTION: Draws a magenta line from (321, 12) to (323, 141).
; PLAN: r0=321(x1), r1=12(y1), r2=323(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 12
LDI r2, 323
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
