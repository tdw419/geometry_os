; DESCRIPTION: Composite: Places a white dot at position (492, 5) then Places a magenta circle of radius 74 at center (237, 180) then Creates a red rectangular region at (122, 57) spanning 92 by 11 pixels.
; PLAN: r0=492(x), r1=5(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=237(x), r6=180(y), r7=74(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x), r11=57(y), r12=92(width), r13=11(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 492
LDI r1, 5
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 237
LDI r6, 180
LDI r7, 74
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 57
LDI r12, 92
LDI r13, 11
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
