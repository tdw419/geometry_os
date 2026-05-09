; DESCRIPTION: Places a black line segment connecting (500, 96) to (432, 211).
; PLAN: r0=500(x1), r1=96(y1), r2=432(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 96
LDI r2, 432
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
