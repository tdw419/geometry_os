; DESCRIPTION: Places a blue line segment connecting (506, 101) to (257, 107).
; PLAN: r0=506(x1), r1=101(y1), r2=257(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 101
LDI r2, 257
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
