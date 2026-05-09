; DESCRIPTION: Composite: Places a magenta dot at position (170, 73) then Draws a red circle centered at (204, 48) with radius 45 then Creates a purple rectangular region at (332, 116) spanning 96 by 116 pixels.
; PLAN: r0=170(x), r1=73(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=204(x), r6=48(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=332(x), r11=116(y), r12=96(width), r13=116(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 73
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 48
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 332
LDI r11, 116
LDI r12, 96
LDI r13, 116
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
