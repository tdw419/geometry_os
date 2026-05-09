; DESCRIPTION: Places a blue line segment connecting (92, 19) to (19, 2).
; PLAN: r0=92(x1), r1=19(y1), r2=19(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 19
LDI r2, 19
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
