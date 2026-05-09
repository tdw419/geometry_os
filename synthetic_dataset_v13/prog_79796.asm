; DESCRIPTION: Places a green line segment connecting (417, 232) to (387, 41).
; PLAN: r0=417(x1), r1=232(y1), r2=387(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 232
LDI r2, 387
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
