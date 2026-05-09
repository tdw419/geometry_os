; DESCRIPTION: Places a black line segment connecting (339, 19) to (215, 159).
; PLAN: r0=339(x1), r1=19(y1), r2=215(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 19
LDI r2, 215
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
