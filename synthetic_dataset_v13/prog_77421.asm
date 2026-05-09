; DESCRIPTION: Draws a yellow line from (453, 173) to (390, 94).
; PLAN: r0=453(x1), r1=173(y1), r2=390(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 173
LDI r2, 390
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
