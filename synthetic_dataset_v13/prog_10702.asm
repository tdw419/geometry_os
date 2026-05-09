; DESCRIPTION: Places a purple line segment connecting (103, 198) to (382, 178).
; PLAN: r0=103(x1), r1=198(y1), r2=382(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 198
LDI r2, 382
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
