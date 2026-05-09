; DESCRIPTION: Composite: Sets a single red pixel at (217, 240) then Draws a white circle centered at (112, 44) with radius 26 then Draws a purple rectangle at (417, 143) with width 42 and height 58.
; PLAN: r0=217(x), r1=240(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=44(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=417(x), r11=143(y), r12=42(width), r13=58(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 240
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 112
LDI r6, 44
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 417
LDI r11, 143
LDI r12, 42
LDI r13, 58
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
