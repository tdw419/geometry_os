; DESCRIPTION: Places a white line segment connecting (454, 18) to (182, 203).
; PLAN: r0=454(x1), r1=18(y1), r2=182(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 18
LDI r2, 182
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
