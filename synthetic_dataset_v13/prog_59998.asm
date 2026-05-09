; DESCRIPTION: Places a black line segment connecting (360, 56) to (301, 165).
; PLAN: r0=360(x1), r1=56(y1), r2=301(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 56
LDI r2, 301
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
