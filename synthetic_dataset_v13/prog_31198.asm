; DESCRIPTION: Places a orange line segment connecting (250, 46) to (349, 221).
; PLAN: r0=250(x1), r1=46(y1), r2=349(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 46
LDI r2, 349
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
