; DESCRIPTION: Places a blue line segment connecting (59, 160) to (241, 179).
; PLAN: r0=59(x1), r1=160(y1), r2=241(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 160
LDI r2, 241
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
