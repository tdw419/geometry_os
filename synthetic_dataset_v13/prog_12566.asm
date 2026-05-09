; DESCRIPTION: Draws a black line from (237, 143) to (159, 151).
; PLAN: r0=237(x1), r1=143(y1), r2=159(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 143
LDI r2, 159
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
