; DESCRIPTION: Places a orange line segment connecting (416, 237) to (185, 89).
; PLAN: r0=416(x1), r1=237(y1), r2=185(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 237
LDI r2, 185
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
