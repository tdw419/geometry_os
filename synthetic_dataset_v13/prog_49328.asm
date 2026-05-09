; DESCRIPTION: Places a orange line segment connecting (333, 80) to (173, 203).
; PLAN: r0=333(x1), r1=80(y1), r2=173(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 80
LDI r2, 173
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
