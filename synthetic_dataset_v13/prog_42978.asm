; DESCRIPTION: Places a magenta line segment connecting (486, 72) to (147, 103).
; PLAN: r0=486(x1), r1=72(y1), r2=147(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 72
LDI r2, 147
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
