; DESCRIPTION: Places a black line segment connecting (76, 101) to (170, 198).
; PLAN: r0=76(x1), r1=101(y1), r2=170(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 101
LDI r2, 170
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
