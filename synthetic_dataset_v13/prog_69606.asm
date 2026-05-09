; DESCRIPTION: Places a white line segment connecting (336, 2) to (287, 167).
; PLAN: r0=336(x1), r1=2(y1), r2=287(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 2
LDI r2, 287
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
