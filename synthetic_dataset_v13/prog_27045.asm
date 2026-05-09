; DESCRIPTION: Places a blue line segment connecting (47, 185) to (64, 249).
; PLAN: r0=47(x1), r1=185(y1), r2=64(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 185
LDI r2, 64
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
