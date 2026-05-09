; DESCRIPTION: Places a white line segment connecting (67, 220) to (454, 206).
; PLAN: r0=67(x1), r1=220(y1), r2=454(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 220
LDI r2, 454
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
