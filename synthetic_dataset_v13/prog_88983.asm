; DESCRIPTION: Draws a green line from (444, 155) to (223, 101).
; PLAN: r0=444(x1), r1=155(y1), r2=223(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 155
LDI r2, 223
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
