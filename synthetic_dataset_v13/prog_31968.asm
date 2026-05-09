; DESCRIPTION: Places a purple line segment connecting (467, 14) to (173, 89).
; PLAN: r0=467(x1), r1=14(y1), r2=173(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 14
LDI r2, 173
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
