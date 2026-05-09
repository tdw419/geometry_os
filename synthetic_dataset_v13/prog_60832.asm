; DESCRIPTION: Places a purple line segment connecting (223, 165) to (299, 214).
; PLAN: r0=223(x1), r1=165(y1), r2=299(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 165
LDI r2, 299
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
