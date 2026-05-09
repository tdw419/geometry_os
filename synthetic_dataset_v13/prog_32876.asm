; DESCRIPTION: Places a white line segment connecting (318, 67) to (27, 36).
; PLAN: r0=318(x1), r1=67(y1), r2=27(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 67
LDI r2, 27
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
