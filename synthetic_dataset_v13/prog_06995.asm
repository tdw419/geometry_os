; DESCRIPTION: Places a white line segment connecting (387, 40) to (314, 137).
; PLAN: r0=387(x1), r1=40(y1), r2=314(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 40
LDI r2, 314
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
