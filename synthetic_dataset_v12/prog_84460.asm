; DESCRIPTION: Places a black line segment connecting (222, 212) to (104, 214).
; PLAN: r0=222(x1), r1=212(y1), r2=104(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 212
LDI r2, 104
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
