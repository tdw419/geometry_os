; DESCRIPTION: Places a green line segment connecting (67, 35) to (402, 153).
; PLAN: r0=67(x1), r1=35(y1), r2=402(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 35
LDI r2, 402
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
