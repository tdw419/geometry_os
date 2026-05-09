; DESCRIPTION: Places a blue line segment connecting (92, 163) to (354, 88).
; PLAN: r0=92(x1), r1=163(y1), r2=354(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 163
LDI r2, 354
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
