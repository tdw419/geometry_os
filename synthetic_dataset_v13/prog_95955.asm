; DESCRIPTION: Places a blue line segment connecting (123, 83) to (45, 92).
; PLAN: r0=123(x1), r1=83(y1), r2=45(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 83
LDI r2, 45
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
