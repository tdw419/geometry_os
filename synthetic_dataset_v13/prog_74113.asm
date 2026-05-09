; DESCRIPTION: Places a white line segment connecting (473, 203) to (185, 63).
; PLAN: r0=473(x1), r1=203(y1), r2=185(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 203
LDI r2, 185
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
