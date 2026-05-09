; DESCRIPTION: Draws a yellow line from (356, 106) to (261, 32).
; PLAN: r0=356(x1), r1=106(y1), r2=261(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 106
LDI r2, 261
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
