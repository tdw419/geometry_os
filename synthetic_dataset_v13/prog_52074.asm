; DESCRIPTION: Renders a magenta line between points (147, 170) and (475, 195).
; PLAN: r0=147(x1), r1=170(y1), r2=475(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 170
LDI r2, 475
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
