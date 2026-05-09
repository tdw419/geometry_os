; DESCRIPTION: Places a purple line segment connecting (282, 220) to (183, 17).
; PLAN: r0=282(x1), r1=220(y1), r2=183(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 220
LDI r2, 183
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
