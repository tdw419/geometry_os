; DESCRIPTION: Places a blue line segment connecting (316, 16) to (327, 130).
; PLAN: r0=316(x1), r1=16(y1), r2=327(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 16
LDI r2, 327
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
