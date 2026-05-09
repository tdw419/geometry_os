; DESCRIPTION: Draws a black line from (76, 84) to (116, 169).
; PLAN: r0=76(x1), r1=84(y1), r2=116(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 84
LDI r2, 116
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
