; DESCRIPTION: Places a yellow line segment connecting (117, 133) to (275, 62).
; PLAN: r0=117(x1), r1=133(y1), r2=275(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 133
LDI r2, 275
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
