; DESCRIPTION: Draws a yellow line from (312, 255) to (259, 105).
; PLAN: r0=312(x1), r1=255(y1), r2=259(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 255
LDI r2, 259
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
