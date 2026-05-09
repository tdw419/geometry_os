; DESCRIPTION: Draws a black line from (364, 88) to (253, 204).
; PLAN: r0=364(x1), r1=88(y1), r2=253(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 88
LDI r2, 253
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
