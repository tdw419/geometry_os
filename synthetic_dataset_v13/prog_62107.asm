; DESCRIPTION: Places a purple line segment connecting (134, 206) to (429, 75).
; PLAN: r0=134(x1), r1=206(y1), r2=429(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 206
LDI r2, 429
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
