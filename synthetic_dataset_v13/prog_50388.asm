; DESCRIPTION: Places a blue line segment connecting (214, 199) to (153, 61).
; PLAN: r0=214(x1), r1=199(y1), r2=153(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 199
LDI r2, 153
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
