; DESCRIPTION: Places a yellow line segment connecting (484, 116) to (475, 195).
; PLAN: r0=484(x1), r1=116(y1), r2=475(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 116
LDI r2, 475
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
