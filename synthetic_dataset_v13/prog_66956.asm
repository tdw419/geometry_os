; DESCRIPTION: Places a white line segment connecting (384, 148) to (232, 99).
; PLAN: r0=384(x1), r1=148(y1), r2=232(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 148
LDI r2, 232
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
