; DESCRIPTION: Places a blue line segment connecting (121, 172) to (351, 194).
; PLAN: r0=121(x1), r1=172(y1), r2=351(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 172
LDI r2, 351
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
