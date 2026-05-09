; DESCRIPTION: Draws a yellow line from (250, 165) to (222, 113).
; PLAN: r0=250(x1), r1=165(y1), r2=222(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 165
LDI r2, 222
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
