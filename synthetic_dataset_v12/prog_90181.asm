; DESCRIPTION: Places a green line segment connecting (269, 172) to (296, 201).
; PLAN: r0=269(x1), r1=172(y1), r2=296(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 172
LDI r2, 296
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
