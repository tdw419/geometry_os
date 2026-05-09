; DESCRIPTION: Places a blue line segment connecting (141, 175) to (408, 248).
; PLAN: r0=141(x1), r1=175(y1), r2=408(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 175
LDI r2, 408
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
