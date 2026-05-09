; DESCRIPTION: Draws a yellow line from (350, 123) to (418, 198).
; PLAN: r0=350(x1), r1=123(y1), r2=418(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 123
LDI r2, 418
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
