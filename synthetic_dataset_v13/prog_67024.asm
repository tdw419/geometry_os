; DESCRIPTION: Places a yellow line segment connecting (190, 115) to (183, 159).
; PLAN: r0=190(x1), r1=115(y1), r2=183(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 115
LDI r2, 183
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
