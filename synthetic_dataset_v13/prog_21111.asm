; DESCRIPTION: Places a magenta line segment connecting (8, 98) to (167, 147).
; PLAN: r0=8(x1), r1=98(y1), r2=167(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 98
LDI r2, 167
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
