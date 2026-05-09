; DESCRIPTION: Places a black line segment connecting (280, 167) to (232, 160).
; PLAN: r0=280(x1), r1=167(y1), r2=232(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 167
LDI r2, 232
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
