; DESCRIPTION: Draws a magenta line from (147, 107) to (51, 112).
; PLAN: r0=147(x1), r1=107(y1), r2=51(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 107
LDI r2, 51
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
