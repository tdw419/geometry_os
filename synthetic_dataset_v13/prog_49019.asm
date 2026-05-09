; DESCRIPTION: Places a green line segment connecting (372, 201) to (424, 172).
; PLAN: r0=372(x1), r1=201(y1), r2=424(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 201
LDI r2, 424
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
