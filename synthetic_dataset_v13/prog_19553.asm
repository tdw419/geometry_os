; DESCRIPTION: Places a white line segment connecting (1, 180) to (49, 203).
; PLAN: r0=1(x1), r1=180(y1), r2=49(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 180
LDI r2, 49
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
