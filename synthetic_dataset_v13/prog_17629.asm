; DESCRIPTION: Places a green line segment connecting (232, 58) to (458, 176).
; PLAN: r0=232(x1), r1=58(y1), r2=458(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 58
LDI r2, 458
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
