; DESCRIPTION: Places a yellow line segment connecting (459, 203) to (383, 4).
; PLAN: r0=459(x1), r1=203(y1), r2=383(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 203
LDI r2, 383
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
