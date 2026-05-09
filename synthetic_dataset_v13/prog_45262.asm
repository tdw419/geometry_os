; DESCRIPTION: Places a magenta line segment connecting (408, 164) to (302, 122).
; PLAN: r0=408(x1), r1=164(y1), r2=302(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 164
LDI r2, 302
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
