; DESCRIPTION: Places a white line segment connecting (155, 68) to (449, 39).
; PLAN: r0=155(x1), r1=68(y1), r2=449(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 68
LDI r2, 449
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
