; DESCRIPTION: Places a white line segment connecting (126, 219) to (208, 109).
; PLAN: r0=126(x1), r1=219(y1), r2=208(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 219
LDI r2, 208
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
