; DESCRIPTION: Draws a yellow line from (245, 196) to (472, 245).
; PLAN: r0=245(x1), r1=196(y1), r2=472(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 196
LDI r2, 472
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
