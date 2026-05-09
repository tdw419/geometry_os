; DESCRIPTION: Places a white line segment connecting (69, 187) to (396, 22).
; PLAN: r0=69(x1), r1=187(y1), r2=396(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 187
LDI r2, 396
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
