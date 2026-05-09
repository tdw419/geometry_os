; DESCRIPTION: Places a green line segment connecting (249, 241) to (94, 35).
; PLAN: r0=249(x1), r1=241(y1), r2=94(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 241
LDI r2, 94
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
