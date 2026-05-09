; DESCRIPTION: Places a blue line segment connecting (380, 58) to (226, 145).
; PLAN: r0=380(x1), r1=58(y1), r2=226(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 58
LDI r2, 226
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
