; DESCRIPTION: Places a black line segment connecting (254, 165) to (371, 233).
; PLAN: r0=254(x1), r1=165(y1), r2=371(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 165
LDI r2, 371
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
