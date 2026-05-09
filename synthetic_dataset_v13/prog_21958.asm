; DESCRIPTION: Places a black line segment connecting (347, 48) to (199, 232).
; PLAN: r0=347(x1), r1=48(y1), r2=199(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 48
LDI r2, 199
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
