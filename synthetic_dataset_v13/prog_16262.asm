; DESCRIPTION: Places a yellow line segment connecting (160, 123) to (174, 198).
; PLAN: r0=160(x1), r1=123(y1), r2=174(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 123
LDI r2, 174
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
