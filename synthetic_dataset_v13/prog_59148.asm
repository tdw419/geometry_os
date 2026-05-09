; DESCRIPTION: Composite: Sets a single white pixel at (179, 122) then Renders a yellow disk with center (312, 144) and radius 46 then Draws a black line from (156, 61) to (448, 74).
; PLAN: r0=179(x), r1=122(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=144(y), r7=46(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=156(x1), r11=61(y1), r12=448(x2), r13=74(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 122
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 144
LDI r7, 46
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 156
LDI r11, 61
LDI r12, 448
LDI r13, 74
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
