; DESCRIPTION: Places a black line segment connecting (347, 50) to (422, 110).
; PLAN: r0=347(x1), r1=50(y1), r2=422(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 50
LDI r2, 422
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
