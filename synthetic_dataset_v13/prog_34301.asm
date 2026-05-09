; DESCRIPTION: Places a black line segment connecting (412, 118) to (246, 226).
; PLAN: r0=412(x1), r1=118(y1), r2=246(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 118
LDI r2, 246
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
