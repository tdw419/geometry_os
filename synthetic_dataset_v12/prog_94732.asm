; DESCRIPTION: Renders a magenta line between points (362, 137) and (94, 145).
; PLAN: r0=362(x1), r1=137(y1), r2=94(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 137
LDI r2, 94
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
