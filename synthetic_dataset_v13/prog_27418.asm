; DESCRIPTION: Places a magenta line segment connecting (20, 153) to (6, 199).
; PLAN: r0=20(x1), r1=153(y1), r2=6(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 153
LDI r2, 6
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
