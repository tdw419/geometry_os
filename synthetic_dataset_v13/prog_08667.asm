; DESCRIPTION: Places a blue line segment connecting (5, 7) to (376, 226).
; PLAN: r0=5(x1), r1=7(y1), r2=376(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 7
LDI r2, 376
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
