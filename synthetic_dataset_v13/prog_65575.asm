; DESCRIPTION: Draws a yellow line from (64, 72) to (98, 129).
; PLAN: r0=64(x1), r1=72(y1), r2=98(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 72
LDI r2, 98
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
