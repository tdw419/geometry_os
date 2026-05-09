; DESCRIPTION: Places a white line segment connecting (35, 27) to (325, 203).
; PLAN: r0=35(x1), r1=27(y1), r2=325(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 27
LDI r2, 325
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
