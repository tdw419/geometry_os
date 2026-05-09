; DESCRIPTION: Composite: Draws a blue line from (285, 253) to (185, 209) then Places a red circle of radius 40 at center (441, 158) then Renders a black box of size 109x95 starting at (382, 122).
; PLAN: r0=285(x1), r1=253(y1), r2=185(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=158(y), r7=40(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=382(x), r11=122(y), r12=109(width), r13=95(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 253
LDI r2, 185
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 158
LDI r7, 40
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 382
LDI r11, 122
LDI r12, 109
LDI r13, 95
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
