; DESCRIPTION: Draws a yellow line from (13, 144) to (131, 183).
; PLAN: r0=13(x1), r1=144(y1), r2=131(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 144
LDI r2, 131
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
