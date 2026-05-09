; DESCRIPTION: Places a white line segment connecting (144, 126) to (477, 159).
; PLAN: r0=144(x1), r1=126(y1), r2=477(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 126
LDI r2, 477
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
