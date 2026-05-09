; DESCRIPTION: Places a blue line segment connecting (429, 153) to (122, 176).
; PLAN: r0=429(x1), r1=153(y1), r2=122(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 153
LDI r2, 122
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
