; DESCRIPTION: Draws a yellow line from (259, 66) to (373, 253).
; PLAN: r0=259(x1), r1=66(y1), r2=373(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 66
LDI r2, 373
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
