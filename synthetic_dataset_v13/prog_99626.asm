; DESCRIPTION: Places a black line segment connecting (368, 64) to (467, 56).
; PLAN: r0=368(x1), r1=64(y1), r2=467(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 64
LDI r2, 467
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
