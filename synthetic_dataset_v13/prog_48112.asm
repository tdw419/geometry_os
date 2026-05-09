; DESCRIPTION: Draws a purple line from (244, 159) to (184, 44).
; PLAN: r0=244(x1), r1=159(y1), r2=184(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 159
LDI r2, 184
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
