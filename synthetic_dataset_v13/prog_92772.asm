; DESCRIPTION: Draws a yellow line from (197, 12) to (427, 3).
; PLAN: r0=197(x1), r1=12(y1), r2=427(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 12
LDI r2, 427
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
