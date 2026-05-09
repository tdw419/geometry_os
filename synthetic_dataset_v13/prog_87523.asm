; DESCRIPTION: Draws a black line from (62, 172) to (101, 36).
; PLAN: r0=62(x1), r1=172(y1), r2=101(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 172
LDI r2, 101
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
