; DESCRIPTION: Places a yellow line segment connecting (231, 198) to (301, 239).
; PLAN: r0=231(x1), r1=198(y1), r2=301(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 198
LDI r2, 301
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
