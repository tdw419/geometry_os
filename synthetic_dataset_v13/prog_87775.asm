; DESCRIPTION: Places a white line segment connecting (244, 158) to (338, 240).
; PLAN: r0=244(x1), r1=158(y1), r2=338(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 158
LDI r2, 338
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
