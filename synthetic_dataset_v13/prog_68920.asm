; DESCRIPTION: Draws a white line from (496, 101) to (5, 151).
; PLAN: r0=496(x1), r1=101(y1), r2=5(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 101
LDI r2, 5
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
