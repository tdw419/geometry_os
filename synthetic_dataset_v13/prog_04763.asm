; DESCRIPTION: Composite: Sets a single purple pixel at (319, 229) then Places a purple circle of radius 32 at center (177, 65) then Draws a purple rectangle at (150, 39) with width 65 and height 118.
; PLAN: r0=319(x), r1=229(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=65(y), r7=32(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=150(x), r11=39(y), r12=65(width), r13=118(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 229
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 177
LDI r6, 65
LDI r7, 32
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 150
LDI r11, 39
LDI r12, 65
LDI r13, 118
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
