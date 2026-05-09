; DESCRIPTION: Places a yellow line segment connecting (108, 232) to (301, 224).
; PLAN: r0=108(x1), r1=232(y1), r2=301(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 232
LDI r2, 301
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
