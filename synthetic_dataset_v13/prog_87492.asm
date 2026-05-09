; DESCRIPTION: Places a green line segment connecting (287, 19) to (44, 191).
; PLAN: r0=287(x1), r1=19(y1), r2=44(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 19
LDI r2, 44
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
