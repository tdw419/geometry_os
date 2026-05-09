; DESCRIPTION: Places a black line segment connecting (157, 210) to (58, 9).
; PLAN: r0=157(x1), r1=210(y1), r2=58(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 210
LDI r2, 58
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
