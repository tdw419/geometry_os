; DESCRIPTION: Places a red line segment connecting (194, 125) to (183, 197).
; PLAN: r0=194(x1), r1=125(y1), r2=183(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 125
LDI r2, 183
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
