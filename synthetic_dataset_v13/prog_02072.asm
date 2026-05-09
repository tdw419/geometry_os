; DESCRIPTION: Places a magenta line segment connecting (372, 235) to (259, 101).
; PLAN: r0=372(x1), r1=235(y1), r2=259(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 235
LDI r2, 259
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
