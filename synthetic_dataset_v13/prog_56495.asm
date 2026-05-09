; DESCRIPTION: Places a white line segment connecting (281, 255) to (496, 122).
; PLAN: r0=281(x1), r1=255(y1), r2=496(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 255
LDI r2, 496
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
