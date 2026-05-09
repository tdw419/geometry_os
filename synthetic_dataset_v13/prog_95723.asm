; DESCRIPTION: Draws a black line from (226, 97) to (133, 0).
; PLAN: r0=226(x1), r1=97(y1), r2=133(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 97
LDI r2, 133
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
