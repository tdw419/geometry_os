; DESCRIPTION: Places a orange line segment connecting (217, 192) to (259, 55).
; PLAN: r0=217(x1), r1=192(y1), r2=259(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 192
LDI r2, 259
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
