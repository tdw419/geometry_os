; DESCRIPTION: Places a white line segment connecting (299, 217) to (355, 239).
; PLAN: r0=299(x1), r1=217(y1), r2=355(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 217
LDI r2, 355
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
