; DESCRIPTION: Places a blue line segment connecting (418, 47) to (92, 51).
; PLAN: r0=418(x1), r1=47(y1), r2=92(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 47
LDI r2, 92
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
