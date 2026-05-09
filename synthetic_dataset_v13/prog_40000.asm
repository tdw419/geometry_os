; DESCRIPTION: Draws a yellow line from (86, 83) to (18, 183).
; PLAN: r0=86(x1), r1=83(y1), r2=18(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 83
LDI r2, 18
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
