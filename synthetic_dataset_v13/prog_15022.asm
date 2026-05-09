; DESCRIPTION: Draws a yellow line from (455, 170) to (198, 32).
; PLAN: r0=455(x1), r1=170(y1), r2=198(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 170
LDI r2, 198
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
