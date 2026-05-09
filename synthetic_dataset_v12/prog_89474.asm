; DESCRIPTION: Places a green line segment connecting (123, 229) to (451, 59).
; PLAN: r0=123(x1), r1=229(y1), r2=451(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 229
LDI r2, 451
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
