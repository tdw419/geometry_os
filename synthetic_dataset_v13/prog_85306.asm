; DESCRIPTION: Places a orange line segment connecting (472, 244) to (230, 37).
; PLAN: r0=472(x1), r1=244(y1), r2=230(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 244
LDI r2, 230
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
