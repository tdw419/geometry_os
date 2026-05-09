; DESCRIPTION: Places a black line segment connecting (92, 111) to (314, 53).
; PLAN: r0=92(x1), r1=111(y1), r2=314(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 111
LDI r2, 314
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
