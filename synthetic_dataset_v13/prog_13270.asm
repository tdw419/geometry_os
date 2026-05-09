; DESCRIPTION: Places a white line segment connecting (203, 55) to (317, 131).
; PLAN: r0=203(x1), r1=55(y1), r2=317(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 55
LDI r2, 317
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
