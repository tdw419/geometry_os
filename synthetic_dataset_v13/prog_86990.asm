; DESCRIPTION: Places a purple line segment connecting (429, 64) to (127, 50).
; PLAN: r0=429(x1), r1=64(y1), r2=127(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 64
LDI r2, 127
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
