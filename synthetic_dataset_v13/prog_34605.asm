; DESCRIPTION: Places a black line segment connecting (459, 69) to (220, 203).
; PLAN: r0=459(x1), r1=69(y1), r2=220(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 69
LDI r2, 220
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
