; DESCRIPTION: Places a purple line segment connecting (265, 201) to (16, 239).
; PLAN: r0=265(x1), r1=201(y1), r2=16(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 201
LDI r2, 16
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
