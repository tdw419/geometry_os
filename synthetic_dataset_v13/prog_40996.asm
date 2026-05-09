; DESCRIPTION: Places a white line segment connecting (399, 67) to (126, 183).
; PLAN: r0=399(x1), r1=67(y1), r2=126(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 67
LDI r2, 126
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
