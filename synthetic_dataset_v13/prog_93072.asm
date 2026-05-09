; DESCRIPTION: Places a yellow line segment connecting (231, 161) to (123, 101).
; PLAN: r0=231(x1), r1=161(y1), r2=123(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 161
LDI r2, 123
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
