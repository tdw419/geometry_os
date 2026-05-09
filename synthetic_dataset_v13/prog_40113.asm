; DESCRIPTION: Draws a yellow line from (17, 125) to (74, 11).
; PLAN: r0=17(x1), r1=125(y1), r2=74(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 125
LDI r2, 74
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
