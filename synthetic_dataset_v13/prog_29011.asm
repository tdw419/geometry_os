; DESCRIPTION: Places a orange line segment connecting (32, 73) to (160, 218).
; PLAN: r0=32(x1), r1=73(y1), r2=160(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 73
LDI r2, 160
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
