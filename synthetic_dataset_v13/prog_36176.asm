; DESCRIPTION: Draws a yellow line from (101, 233) to (38, 125).
; PLAN: r0=101(x1), r1=233(y1), r2=38(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 233
LDI r2, 38
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
