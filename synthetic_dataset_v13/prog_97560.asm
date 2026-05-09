; DESCRIPTION: Places a black line segment connecting (117, 53) to (170, 88).
; PLAN: r0=117(x1), r1=53(y1), r2=170(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 53
LDI r2, 170
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
