; DESCRIPTION: Draws a yellow line from (119, 227) to (234, 12).
; PLAN: r0=119(x1), r1=227(y1), r2=234(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 227
LDI r2, 234
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
