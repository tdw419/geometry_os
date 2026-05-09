; DESCRIPTION: Places a yellow line segment connecting (359, 193) to (472, 199).
; PLAN: r0=359(x1), r1=193(y1), r2=472(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 193
LDI r2, 472
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
