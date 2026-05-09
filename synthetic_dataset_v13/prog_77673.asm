; DESCRIPTION: Draws a yellow line from (129, 163) to (261, 64).
; PLAN: r0=129(x1), r1=163(y1), r2=261(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 163
LDI r2, 261
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
