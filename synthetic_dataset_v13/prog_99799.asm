; DESCRIPTION: Places a white line segment connecting (29, 21) to (118, 232).
; PLAN: r0=29(x1), r1=21(y1), r2=118(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 21
LDI r2, 118
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
