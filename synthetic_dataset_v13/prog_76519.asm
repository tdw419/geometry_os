; DESCRIPTION: Renders a magenta line between points (362, 107) and (159, 63).
; PLAN: r0=362(x1), r1=107(y1), r2=159(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 107
LDI r2, 159
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
