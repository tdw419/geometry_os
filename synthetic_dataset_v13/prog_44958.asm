; DESCRIPTION: Places a black line segment connecting (283, 126) to (61, 122).
; PLAN: r0=283(x1), r1=126(y1), r2=61(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 126
LDI r2, 61
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
