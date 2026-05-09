; DESCRIPTION: Places a orange line segment connecting (198, 225) to (108, 58).
; PLAN: r0=198(x1), r1=225(y1), r2=108(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 225
LDI r2, 108
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
