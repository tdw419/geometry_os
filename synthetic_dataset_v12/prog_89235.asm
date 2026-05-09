; DESCRIPTION: Places a black line segment connecting (328, 76) to (58, 18).
; PLAN: r0=328(x1), r1=76(y1), r2=58(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 76
LDI r2, 58
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
