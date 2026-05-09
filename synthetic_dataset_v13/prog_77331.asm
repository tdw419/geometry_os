; DESCRIPTION: Draws a red line from (74, 192) to (159, 200).
; PLAN: r0=74(x1), r1=192(y1), r2=159(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 192
LDI r2, 159
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
