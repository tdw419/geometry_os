; DESCRIPTION: Places a magenta line segment connecting (259, 196) to (408, 145).
; PLAN: r0=259(x1), r1=196(y1), r2=408(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 196
LDI r2, 408
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
