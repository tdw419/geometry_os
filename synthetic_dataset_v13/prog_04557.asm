; DESCRIPTION: Places a white line segment connecting (9, 153) to (449, 227).
; PLAN: r0=9(x1), r1=153(y1), r2=449(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 153
LDI r2, 449
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
