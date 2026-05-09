; DESCRIPTION: Places a purple line segment connecting (69, 114) to (456, 227).
; PLAN: r0=69(x1), r1=114(y1), r2=456(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 114
LDI r2, 456
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
