; DESCRIPTION: Draws a yellow line from (270, 0) to (273, 175).
; PLAN: r0=270(x1), r1=0(y1), r2=273(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 0
LDI r2, 273
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
