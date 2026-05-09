; DESCRIPTION: Composite: Sets a single red pixel at (241, 165) then Creates a yellow circular shape at (415, 182) with radius 55 then Draws a green rectangle at (146, 14) with width 87 and height 60.
; PLAN: r0=241(x), r1=165(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=182(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x), r11=14(y), r12=87(width), r13=60(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 165
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 415
LDI r6, 182
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 14
LDI r12, 87
LDI r13, 60
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
