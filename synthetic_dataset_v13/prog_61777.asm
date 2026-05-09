; DESCRIPTION: Draws a yellow line from (491, 195) to (238, 110).
; PLAN: r0=491(x1), r1=195(y1), r2=238(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 195
LDI r2, 238
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
