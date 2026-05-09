; DESCRIPTION: Composite: Sets a single purple pixel at (107, 208) then Draws a purple rectangle at (230, 118) with width 59 and height 109 then Creates a purple circular shape at (112, 95) with radius 53.
; PLAN: r0=107(x), r1=208(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=118(y), r7=59(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=112(x), r11=95(y), r12=53(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 107
LDI r1, 208
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 118
LDI r7, 59
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 95
LDI r12, 53
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
