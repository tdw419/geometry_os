; DESCRIPTION: Places a blue line segment connecting (54, 177) to (101, 248).
; PLAN: r0=54(x1), r1=177(y1), r2=101(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 177
LDI r2, 101
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
