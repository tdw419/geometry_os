; DESCRIPTION: Places a purple line segment connecting (223, 165) to (191, 191).
; PLAN: r0=223(x1), r1=165(y1), r2=191(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 165
LDI r2, 191
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
