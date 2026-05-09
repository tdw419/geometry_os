; DESCRIPTION: Draws a yellow line from (390, 135) to (251, 251).
; PLAN: r0=390(x1), r1=135(y1), r2=251(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 135
LDI r2, 251
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
