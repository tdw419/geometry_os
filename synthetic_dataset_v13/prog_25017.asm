; DESCRIPTION: Places a white line segment connecting (409, 123) to (303, 33).
; PLAN: r0=409(x1), r1=123(y1), r2=303(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 123
LDI r2, 303
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
