; DESCRIPTION: Draws a black line from (358, 212) to (26, 158).
; PLAN: r0=358(x1), r1=212(y1), r2=26(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 212
LDI r2, 26
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
