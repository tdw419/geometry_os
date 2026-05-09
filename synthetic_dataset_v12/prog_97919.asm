; DESCRIPTION: Places a blue line segment connecting (287, 45) to (325, 171).
; PLAN: r0=287(x1), r1=45(y1), r2=325(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 45
LDI r2, 325
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
