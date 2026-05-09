; DESCRIPTION: Places a purple line segment connecting (257, 70) to (182, 45).
; PLAN: r0=257(x1), r1=70(y1), r2=182(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 70
LDI r2, 182
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
