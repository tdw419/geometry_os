; DESCRIPTION: Draws a black line from (76, 15) to (337, 157).
; PLAN: r0=76(x1), r1=15(y1), r2=337(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 15
LDI r2, 337
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
