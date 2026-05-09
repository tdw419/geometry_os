; DESCRIPTION: Places a white line segment connecting (102, 232) to (53, 17).
; PLAN: r0=102(x1), r1=232(y1), r2=53(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 232
LDI r2, 53
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
