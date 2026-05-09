; DESCRIPTION: Places a purple line segment connecting (8, 206) to (165, 52).
; PLAN: r0=8(x1), r1=206(y1), r2=165(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 206
LDI r2, 165
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
