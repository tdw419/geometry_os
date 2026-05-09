; DESCRIPTION: Places a white line segment connecting (165, 122) to (184, 80).
; PLAN: r0=165(x1), r1=122(y1), r2=184(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 122
LDI r2, 184
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
