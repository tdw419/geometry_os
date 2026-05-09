; DESCRIPTION: Places a yellow line segment connecting (67, 45) to (179, 40).
; PLAN: r0=67(x1), r1=45(y1), r2=179(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 45
LDI r2, 179
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
