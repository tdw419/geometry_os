; DESCRIPTION: Places a white line segment connecting (342, 217) to (283, 239).
; PLAN: r0=342(x1), r1=217(y1), r2=283(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 217
LDI r2, 283
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
