; DESCRIPTION: Places a purple line segment connecting (197, 219) to (274, 225).
; PLAN: r0=197(x1), r1=219(y1), r2=274(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 219
LDI r2, 274
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
