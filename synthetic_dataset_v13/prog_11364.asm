; DESCRIPTION: Places a purple line segment connecting (159, 232) to (429, 223).
; PLAN: r0=159(x1), r1=232(y1), r2=429(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 232
LDI r2, 429
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
