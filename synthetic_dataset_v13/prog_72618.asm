; DESCRIPTION: Draws a black line from (25, 179) to (454, 116).
; PLAN: r0=25(x1), r1=179(y1), r2=454(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 179
LDI r2, 454
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
