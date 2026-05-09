; DESCRIPTION: Places a white line segment connecting (338, 218) to (67, 178).
; PLAN: r0=338(x1), r1=218(y1), r2=67(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 218
LDI r2, 67
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
