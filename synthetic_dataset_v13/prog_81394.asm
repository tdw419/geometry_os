; DESCRIPTION: Places a blue line segment connecting (305, 58) to (101, 114).
; PLAN: r0=305(x1), r1=58(y1), r2=101(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 58
LDI r2, 101
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
