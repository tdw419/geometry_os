; DESCRIPTION: Places a white line segment connecting (347, 83) to (219, 195).
; PLAN: r0=347(x1), r1=83(y1), r2=219(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 83
LDI r2, 219
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
