; DESCRIPTION: Places a white line segment connecting (9, 90) to (399, 254).
; PLAN: r0=9(x1), r1=90(y1), r2=399(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 90
LDI r2, 399
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
