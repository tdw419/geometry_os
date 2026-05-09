; DESCRIPTION: Places a black line segment connecting (467, 244) to (429, 175).
; PLAN: r0=467(x1), r1=244(y1), r2=429(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 244
LDI r2, 429
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
