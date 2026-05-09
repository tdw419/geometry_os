; DESCRIPTION: Places a red line segment connecting (484, 187) to (257, 114).
; PLAN: r0=484(x1), r1=187(y1), r2=257(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 187
LDI r2, 257
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
