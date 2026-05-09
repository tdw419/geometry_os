; DESCRIPTION: Draws a purple line from (443, 40) to (159, 83).
; PLAN: r0=443(x1), r1=40(y1), r2=159(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 40
LDI r2, 159
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
