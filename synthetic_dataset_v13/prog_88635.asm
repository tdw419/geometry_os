; DESCRIPTION: Places a white line segment connecting (333, 251) to (396, 74).
; PLAN: r0=333(x1), r1=251(y1), r2=396(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 251
LDI r2, 396
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
