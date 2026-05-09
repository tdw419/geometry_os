; DESCRIPTION: Composite: Sets a single red pixel at (172, 92) then Places a white circle of radius 23 at center (327, 77) then Creates a magenta rectangular region at (213, 153) spanning 83 by 43 pixels.
; PLAN: r0=172(x), r1=92(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=77(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=213(x), r11=153(y), r12=83(width), r13=43(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 92
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 327
LDI r6, 77
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 213
LDI r11, 153
LDI r12, 83
LDI r13, 43
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
