; DESCRIPTION: Draws a black line from (43, 153) to (396, 151).
; PLAN: r0=43(x1), r1=153(y1), r2=396(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 153
LDI r2, 396
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
