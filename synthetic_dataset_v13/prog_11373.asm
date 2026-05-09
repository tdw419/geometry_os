; DESCRIPTION: Places a white line segment connecting (291, 211) to (495, 67).
; PLAN: r0=291(x1), r1=211(y1), r2=495(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 211
LDI r2, 495
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
