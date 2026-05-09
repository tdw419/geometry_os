; DESCRIPTION: Places a white line segment connecting (287, 187) to (216, 136).
; PLAN: r0=287(x1), r1=187(y1), r2=216(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 187
LDI r2, 216
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
