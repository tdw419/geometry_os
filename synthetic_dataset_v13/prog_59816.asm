; DESCRIPTION: Places a orange line segment connecting (238, 79) to (198, 244).
; PLAN: r0=238(x1), r1=79(y1), r2=198(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 79
LDI r2, 198
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
