; DESCRIPTION: Places a black line segment connecting (203, 232) to (299, 152).
; PLAN: r0=203(x1), r1=232(y1), r2=299(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 232
LDI r2, 299
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
