; DESCRIPTION: Draws a yellow line from (78, 159) to (3, 244).
; PLAN: r0=78(x1), r1=159(y1), r2=3(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 159
LDI r2, 3
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
