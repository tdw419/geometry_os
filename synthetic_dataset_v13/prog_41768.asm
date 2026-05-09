; DESCRIPTION: Places a black line segment connecting (265, 203) to (16, 67).
; PLAN: r0=265(x1), r1=203(y1), r2=16(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 203
LDI r2, 16
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
