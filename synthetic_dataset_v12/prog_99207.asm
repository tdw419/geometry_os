; DESCRIPTION: Places a magenta line segment connecting (472, 237) to (440, 159).
; PLAN: r0=472(x1), r1=237(y1), r2=440(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 237
LDI r2, 440
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
