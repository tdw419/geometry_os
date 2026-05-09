; DESCRIPTION: Composite: Sets a single black pixel at (29, 4) then Creates a magenta circular shape at (263, 41) with radius 26 then Creates a purple rectangular region at (415, 5) spanning 84 by 40 pixels.
; PLAN: r0=29(x), r1=4(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=263(x), r6=41(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=415(x), r11=5(y), r12=84(width), r13=40(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 4
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 263
LDI r6, 41
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 415
LDI r11, 5
LDI r12, 84
LDI r13, 40
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
