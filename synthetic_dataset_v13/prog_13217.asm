; DESCRIPTION: Places a blue line segment connecting (421, 7) to (116, 130).
; PLAN: r0=421(x1), r1=7(y1), r2=116(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 7
LDI r2, 116
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
