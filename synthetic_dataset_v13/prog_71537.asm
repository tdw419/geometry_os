; DESCRIPTION: Places a white line segment connecting (87, 219) to (496, 95).
; PLAN: r0=87(x1), r1=219(y1), r2=496(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 219
LDI r2, 496
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
