; DESCRIPTION: Places a black line segment connecting (26, 176) to (381, 239).
; PLAN: r0=26(x1), r1=176(y1), r2=381(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 176
LDI r2, 381
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
