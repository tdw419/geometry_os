; DESCRIPTION: Draws a black line from (253, 182) to (416, 147).
; PLAN: r0=253(x1), r1=182(y1), r2=416(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 182
LDI r2, 416
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
