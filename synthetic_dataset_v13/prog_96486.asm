; DESCRIPTION: Places a black line segment connecting (3, 219) to (154, 53).
; PLAN: r0=3(x1), r1=219(y1), r2=154(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 219
LDI r2, 154
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
