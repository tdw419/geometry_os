; DESCRIPTION: Places a black line segment connecting (374, 252) to (347, 33).
; PLAN: r0=374(x1), r1=252(y1), r2=347(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 252
LDI r2, 347
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
