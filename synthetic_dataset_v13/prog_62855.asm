; DESCRIPTION: Places a purple line segment connecting (333, 53) to (253, 75).
; PLAN: r0=333(x1), r1=53(y1), r2=253(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 53
LDI r2, 253
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
