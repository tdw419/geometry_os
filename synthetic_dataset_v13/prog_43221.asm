; DESCRIPTION: Places a magenta line segment connecting (174, 12) to (147, 98).
; PLAN: r0=174(x1), r1=12(y1), r2=147(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 12
LDI r2, 147
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
