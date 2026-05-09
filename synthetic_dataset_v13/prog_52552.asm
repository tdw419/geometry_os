; DESCRIPTION: Places a green line segment connecting (310, 229) to (285, 121).
; PLAN: r0=310(x1), r1=229(y1), r2=285(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 229
LDI r2, 285
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
