; DESCRIPTION: Draws a yellow line from (241, 119) to (64, 114).
; PLAN: r0=241(x1), r1=119(y1), r2=64(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 119
LDI r2, 64
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
