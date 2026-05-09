; DESCRIPTION: Draws a black line from (6, 114) to (511, 129).
; PLAN: r0=6(x1), r1=114(y1), r2=511(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 114
LDI r2, 511
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
