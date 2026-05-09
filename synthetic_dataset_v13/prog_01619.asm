; DESCRIPTION: Places a yellow line segment connecting (409, 59) to (231, 9).
; PLAN: r0=409(x1), r1=59(y1), r2=231(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 59
LDI r2, 231
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
