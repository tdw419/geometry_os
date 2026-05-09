; DESCRIPTION: Places a purple line segment connecting (373, 13) to (311, 213).
; PLAN: r0=373(x1), r1=13(y1), r2=311(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 13
LDI r2, 311
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
