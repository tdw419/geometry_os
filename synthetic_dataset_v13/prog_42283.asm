; DESCRIPTION: Places a blue line segment connecting (334, 18) to (511, 92).
; PLAN: r0=334(x1), r1=18(y1), r2=511(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 18
LDI r2, 511
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
