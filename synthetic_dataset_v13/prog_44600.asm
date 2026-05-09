; DESCRIPTION: Places a purple line segment connecting (311, 117) to (400, 63).
; PLAN: r0=311(x1), r1=117(y1), r2=400(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 117
LDI r2, 400
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
