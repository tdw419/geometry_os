; DESCRIPTION: Places a white line segment connecting (157, 88) to (226, 69).
; PLAN: r0=157(x1), r1=88(y1), r2=226(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 88
LDI r2, 226
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
