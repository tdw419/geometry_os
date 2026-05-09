; DESCRIPTION: Places a black line segment connecting (467, 15) to (118, 173).
; PLAN: r0=467(x1), r1=15(y1), r2=118(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 15
LDI r2, 118
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
