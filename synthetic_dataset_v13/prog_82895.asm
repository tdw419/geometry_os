; DESCRIPTION: Draws a yellow line from (310, 134) to (484, 66).
; PLAN: r0=310(x1), r1=134(y1), r2=484(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 134
LDI r2, 484
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
