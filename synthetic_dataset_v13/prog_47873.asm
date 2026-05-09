; DESCRIPTION: Draws a purple line from (129, 146) to (3, 159).
; PLAN: r0=129(x1), r1=146(y1), r2=3(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 146
LDI r2, 3
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
