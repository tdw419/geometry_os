; DESCRIPTION: Renders a yellow line between points (159, 246) and (442, 135).
; PLAN: r0=159(x1), r1=246(y1), r2=442(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 246
LDI r2, 442
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
