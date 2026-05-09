; DESCRIPTION: Places a orange line segment connecting (29, 109) to (346, 203).
; PLAN: r0=29(x1), r1=109(y1), r2=346(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 109
LDI r2, 346
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
