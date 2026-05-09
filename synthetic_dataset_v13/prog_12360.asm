; DESCRIPTION: Places a magenta line segment connecting (92, 80) to (40, 131).
; PLAN: r0=92(x1), r1=80(y1), r2=40(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 80
LDI r2, 40
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
