; DESCRIPTION: Places a orange line segment connecting (281, 108) to (254, 121).
; PLAN: r0=281(x1), r1=108(y1), r2=254(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 108
LDI r2, 254
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
