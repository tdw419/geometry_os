; DESCRIPTION: Places a orange line segment connecting (360, 152) to (54, 219).
; PLAN: r0=360(x1), r1=152(y1), r2=54(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 152
LDI r2, 54
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
