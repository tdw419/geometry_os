; DESCRIPTION: Places a white line segment connecting (282, 198) to (28, 69).
; PLAN: r0=282(x1), r1=198(y1), r2=28(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 198
LDI r2, 28
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
