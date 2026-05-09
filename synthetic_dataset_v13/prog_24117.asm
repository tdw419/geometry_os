; DESCRIPTION: Places a white line segment connecting (123, 232) to (409, 141).
; PLAN: r0=123(x1), r1=232(y1), r2=409(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 232
LDI r2, 409
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
