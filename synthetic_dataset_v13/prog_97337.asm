; DESCRIPTION: Places a magenta line segment connecting (442, 145) to (92, 62).
; PLAN: r0=442(x1), r1=145(y1), r2=92(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 145
LDI r2, 92
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
