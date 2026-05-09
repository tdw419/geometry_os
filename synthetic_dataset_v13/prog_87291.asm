; DESCRIPTION: Draws a black line from (26, 159) to (62, 144).
; PLAN: r0=26(x1), r1=159(y1), r2=62(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 159
LDI r2, 62
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
