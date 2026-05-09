; DESCRIPTION: Places a black line segment connecting (431, 91) to (500, 167).
; PLAN: r0=431(x1), r1=91(y1), r2=500(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 91
LDI r2, 500
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
