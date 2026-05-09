; DESCRIPTION: Places a purple line segment connecting (263, 206) to (134, 0).
; PLAN: r0=263(x1), r1=206(y1), r2=134(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 206
LDI r2, 134
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
