; DESCRIPTION: Places a yellow line segment connecting (451, 253) to (387, 65).
; PLAN: r0=451(x1), r1=253(y1), r2=387(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 253
LDI r2, 387
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
