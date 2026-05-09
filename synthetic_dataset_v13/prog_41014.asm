; DESCRIPTION: Composite: Draws a magenta rectangle at (10, 109) with width 30 and height 109 then Sets a single purple pixel at (224, 136) then Draws a purple circle centered at (417, 55) with radius 26.
; PLAN: r0=10(x), r1=109(y), r2=30(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x), r6=136(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=417(x), r11=55(y), r12=26(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 109
LDI r2, 30
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 136
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 417
LDI r11, 55
LDI r12, 26
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
