; DESCRIPTION: Places a magenta line segment connecting (200, 30) to (114, 209).
; PLAN: r0=200(x1), r1=30(y1), r2=114(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 30
LDI r2, 114
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
