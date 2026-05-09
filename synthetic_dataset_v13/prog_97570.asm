; DESCRIPTION: Draws a yellow line from (144, 115) to (324, 101).
; PLAN: r0=144(x1), r1=115(y1), r2=324(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 115
LDI r2, 324
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
