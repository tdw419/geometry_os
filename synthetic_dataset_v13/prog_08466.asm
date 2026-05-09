; DESCRIPTION: Draws a yellow line from (478, 141) to (491, 17).
; PLAN: r0=478(x1), r1=141(y1), r2=491(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 141
LDI r2, 491
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
