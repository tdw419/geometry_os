; DESCRIPTION: Places a yellow line segment connecting (148, 67) to (11, 66).
; PLAN: r0=148(x1), r1=67(y1), r2=11(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 67
LDI r2, 11
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
