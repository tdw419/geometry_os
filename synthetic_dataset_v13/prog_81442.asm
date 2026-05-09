; DESCRIPTION: Places a yellow line segment connecting (301, 207) to (232, 193).
; PLAN: r0=301(x1), r1=207(y1), r2=232(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 207
LDI r2, 232
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
