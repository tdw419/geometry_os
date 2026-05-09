; DESCRIPTION: Renders a purple line between points (308, 43) and (230, 76).
; PLAN: r0=308(x1), r1=43(y1), r2=230(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 43
LDI r2, 230
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
