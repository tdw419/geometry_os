; DESCRIPTION: Places a blue line segment connecting (248, 237) to (316, 158).
; PLAN: r0=248(x1), r1=237(y1), r2=316(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 237
LDI r2, 316
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
