; DESCRIPTION: Places a white line segment connecting (88, 31) to (203, 159).
; PLAN: r0=88(x1), r1=31(y1), r2=203(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 31
LDI r2, 203
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
