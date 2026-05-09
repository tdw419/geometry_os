; DESCRIPTION: Places a purple line segment connecting (197, 157) to (196, 183).
; PLAN: r0=197(x1), r1=157(y1), r2=196(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 157
LDI r2, 196
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
