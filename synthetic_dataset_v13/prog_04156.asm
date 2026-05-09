; DESCRIPTION: Composite: Places a black dot at position (355, 228) then Places a white circle of radius 41 at center (121, 94) then Creates a green rectangular region at (268, 144) spanning 92 by 35 pixels.
; PLAN: r0=355(x), r1=228(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=94(y), r7=41(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=268(x), r11=144(y), r12=92(width), r13=35(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 228
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 121
LDI r6, 94
LDI r7, 41
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 268
LDI r11, 144
LDI r12, 92
LDI r13, 35
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
