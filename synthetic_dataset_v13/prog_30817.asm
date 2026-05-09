; DESCRIPTION: Places a magenta line segment connecting (250, 142) to (257, 28).
; PLAN: r0=250(x1), r1=142(y1), r2=257(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 142
LDI r2, 257
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
