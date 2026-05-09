; DESCRIPTION: Draws a yellow line from (26, 24) to (129, 73).
; PLAN: r0=26(x1), r1=24(y1), r2=129(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 24
LDI r2, 129
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
