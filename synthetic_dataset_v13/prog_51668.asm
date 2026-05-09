; DESCRIPTION: Draws a red line from (454, 160) to (456, 151).
; PLAN: r0=454(x1), r1=160(y1), r2=456(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 160
LDI r2, 456
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
