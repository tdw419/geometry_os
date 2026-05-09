; DESCRIPTION: Draws a yellow line from (159, 91) to (163, 38).
; PLAN: r0=159(x1), r1=91(y1), r2=163(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 91
LDI r2, 163
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
