; DESCRIPTION: Places a magenta line segment connecting (257, 133) to (478, 51).
; PLAN: r0=257(x1), r1=133(y1), r2=478(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 133
LDI r2, 478
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
