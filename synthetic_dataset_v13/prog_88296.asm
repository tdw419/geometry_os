; DESCRIPTION: Places a white line segment connecting (67, 57) to (235, 239).
; PLAN: r0=67(x1), r1=57(y1), r2=235(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 57
LDI r2, 235
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
