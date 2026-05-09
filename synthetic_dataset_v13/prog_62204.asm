; DESCRIPTION: Places a yellow line segment connecting (219, 232) to (236, 38).
; PLAN: r0=219(x1), r1=232(y1), r2=236(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 232
LDI r2, 236
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
