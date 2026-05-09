; DESCRIPTION: Draws a red line from (177, 244) to (159, 104).
; PLAN: r0=177(x1), r1=244(y1), r2=159(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 244
LDI r2, 159
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
