; DESCRIPTION: Composite: Draws a red circle centered at (264, 73) with radius 51 then Renders a black box of size 12x107 starting at (467, 134) then Renders a purple line between points (378, 219) and (280, 137).
; PLAN: r0=264(x), r1=73(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=467(x), r6=134(y), r7=12(width), r8=107(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x1), r11=219(y1), r12=280(x2), r13=137(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 73
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 467
LDI r6, 134
LDI r7, 12
LDI r8, 107
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 219
LDI r12, 280
LDI r13, 137
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
