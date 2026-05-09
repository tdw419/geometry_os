; DESCRIPTION: Places a black line segment connecting (272, 231) to (58, 241).
; PLAN: r0=272(x1), r1=231(y1), r2=58(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 231
LDI r2, 58
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
