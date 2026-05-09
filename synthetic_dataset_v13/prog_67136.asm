; DESCRIPTION: Places a yellow line segment connecting (336, 108) to (248, 58).
; PLAN: r0=336(x1), r1=108(y1), r2=248(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 108
LDI r2, 248
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
