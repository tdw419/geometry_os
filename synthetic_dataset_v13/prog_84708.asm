; DESCRIPTION: Places a purple line segment connecting (332, 234) to (429, 166).
; PLAN: r0=332(x1), r1=234(y1), r2=429(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 234
LDI r2, 429
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
