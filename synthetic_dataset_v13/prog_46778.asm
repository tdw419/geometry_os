; DESCRIPTION: Composite: Renders a purple line between points (407, 177) and (175, 52) then Places a magenta dot at position (237, 230) then Draws a blue rectangle at (274, 92) with width 29 and height 93.
; PLAN: r0=407(x1), r1=177(y1), r2=175(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=230(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=274(x), r11=92(y), r12=29(width), r13=93(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 177
LDI r2, 175
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 230
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 274
LDI r11, 92
LDI r12, 29
LDI r13, 93
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
