; DESCRIPTION: Places a blue line segment connecting (214, 250) to (407, 153).
; PLAN: r0=214(x1), r1=250(y1), r2=407(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 250
LDI r2, 407
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
