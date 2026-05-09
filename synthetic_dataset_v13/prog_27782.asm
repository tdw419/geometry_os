; DESCRIPTION: Places a black line segment connecting (245, 134) to (490, 167).
; PLAN: r0=245(x1), r1=134(y1), r2=490(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 134
LDI r2, 490
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
