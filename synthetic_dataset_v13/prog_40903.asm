; DESCRIPTION: Draws a black line from (505, 185) to (223, 157).
; PLAN: r0=505(x1), r1=185(y1), r2=223(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 185
LDI r2, 223
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
