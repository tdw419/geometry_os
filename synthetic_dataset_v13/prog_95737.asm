; DESCRIPTION: Places a black line segment connecting (418, 244) to (500, 60).
; PLAN: r0=418(x1), r1=244(y1), r2=500(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 244
LDI r2, 500
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
