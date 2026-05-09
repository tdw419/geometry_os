; DESCRIPTION: Places a purple line segment connecting (282, 39) to (122, 18).
; PLAN: r0=282(x1), r1=39(y1), r2=122(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 39
LDI r2, 122
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
