; DESCRIPTION: Places a black line segment connecting (29, 197) to (201, 183).
; PLAN: r0=29(x1), r1=197(y1), r2=201(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 197
LDI r2, 201
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
