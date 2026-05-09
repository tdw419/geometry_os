; DESCRIPTION: Places a yellow line segment connecting (416, 198) to (65, 160).
; PLAN: r0=416(x1), r1=198(y1), r2=65(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 198
LDI r2, 65
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
