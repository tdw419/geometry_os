; DESCRIPTION: Draws a yellow line from (128, 29) to (118, 74).
; PLAN: r0=128(x1), r1=29(y1), r2=118(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 29
LDI r2, 118
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
