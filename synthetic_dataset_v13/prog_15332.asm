; DESCRIPTION: Composite: Sets a single blue pixel at (41, 11) then Renders a yellow disk with center (217, 176) and radius 53 then Draws a green line from (116, 155) to (64, 227).
; PLAN: r0=41(x), r1=11(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=176(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=116(x1), r11=155(y1), r12=64(x2), r13=227(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 11
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 176
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 116
LDI r11, 155
LDI r12, 64
LDI r13, 227
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
