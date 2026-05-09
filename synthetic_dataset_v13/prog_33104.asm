; DESCRIPTION: Places a purple line segment connecting (281, 116) to (511, 101).
; PLAN: r0=281(x1), r1=116(y1), r2=511(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 116
LDI r2, 511
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
