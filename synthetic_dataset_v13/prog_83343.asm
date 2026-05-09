; DESCRIPTION: Draws a yellow line from (282, 219) to (222, 12).
; PLAN: r0=282(x1), r1=219(y1), r2=222(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 219
LDI r2, 222
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
