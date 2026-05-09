; DESCRIPTION: Places a yellow line segment connecting (53, 148) to (219, 20).
; PLAN: r0=53(x1), r1=148(y1), r2=219(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 148
LDI r2, 219
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
