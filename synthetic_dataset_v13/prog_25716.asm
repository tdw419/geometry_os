; DESCRIPTION: Draws a yellow line from (199, 238) to (476, 190).
; PLAN: r0=199(x1), r1=238(y1), r2=476(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 238
LDI r2, 476
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
