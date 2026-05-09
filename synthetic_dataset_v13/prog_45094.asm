; DESCRIPTION: Places a blue line segment connecting (450, 23) to (145, 73).
; PLAN: r0=450(x1), r1=23(y1), r2=145(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 23
LDI r2, 145
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
