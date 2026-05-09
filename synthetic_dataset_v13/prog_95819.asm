; DESCRIPTION: Places a black line segment connecting (429, 60) to (184, 181).
; PLAN: r0=429(x1), r1=60(y1), r2=184(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 60
LDI r2, 184
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
