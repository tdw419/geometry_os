; DESCRIPTION: Renders a magenta line between points (323, 204) and (321, 222).
; PLAN: r0=323(x1), r1=204(y1), r2=321(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 204
LDI r2, 321
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
