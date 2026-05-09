; DESCRIPTION: Draws a black line from (179, 255) to (181, 79).
; PLAN: r0=179(x1), r1=255(y1), r2=181(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 255
LDI r2, 181
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
