; DESCRIPTION: Draws a black line from (101, 160) to (60, 227).
; PLAN: r0=101(x1), r1=160(y1), r2=60(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 160
LDI r2, 60
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
