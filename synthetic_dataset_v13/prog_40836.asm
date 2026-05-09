; DESCRIPTION: Places a green line segment connecting (504, 31) to (122, 155).
; PLAN: r0=504(x1), r1=31(y1), r2=122(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 31
LDI r2, 122
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
