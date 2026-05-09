; DESCRIPTION: Places a green line segment connecting (254, 121) to (497, 158).
; PLAN: r0=254(x1), r1=121(y1), r2=497(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 121
LDI r2, 497
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
