; DESCRIPTION: Places a green line segment connecting (218, 197) to (19, 201).
; PLAN: r0=218(x1), r1=197(y1), r2=19(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 197
LDI r2, 19
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
