; DESCRIPTION: Places a orange line segment connecting (338, 198) to (320, 141).
; PLAN: r0=338(x1), r1=198(y1), r2=320(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 198
LDI r2, 320
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
