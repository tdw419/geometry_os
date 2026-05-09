; DESCRIPTION: Places a yellow line segment connecting (378, 210) to (308, 122).
; PLAN: r0=378(x1), r1=210(y1), r2=308(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 210
LDI r2, 308
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
