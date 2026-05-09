; DESCRIPTION: Places a black line segment connecting (336, 24) to (313, 114).
; PLAN: r0=336(x1), r1=24(y1), r2=313(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 24
LDI r2, 313
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
