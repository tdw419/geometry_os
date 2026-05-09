; DESCRIPTION: Places a white line segment connecting (462, 73) to (476, 153).
; PLAN: r0=462(x1), r1=73(y1), r2=476(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 73
LDI r2, 476
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
