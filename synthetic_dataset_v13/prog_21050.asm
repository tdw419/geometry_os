; DESCRIPTION: Draws a white line from (181, 199) to (55, 151).
; PLAN: r0=181(x1), r1=199(y1), r2=55(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 199
LDI r2, 55
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
