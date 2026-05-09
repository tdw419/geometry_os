; DESCRIPTION: Draws a yellow line from (423, 17) to (435, 125).
; PLAN: r0=423(x1), r1=17(y1), r2=435(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 17
LDI r2, 435
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
