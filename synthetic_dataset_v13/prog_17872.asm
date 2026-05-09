; DESCRIPTION: Places a orange line segment connecting (418, 249) to (474, 40).
; PLAN: r0=418(x1), r1=249(y1), r2=474(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 249
LDI r2, 474
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
