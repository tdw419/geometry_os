; DESCRIPTION: Composite: Sets a single cyan pixel at (432, 109) then Creates a green circular shape at (92, 113) with radius 38 then Draws a red rectangle at (122, 29) with width 85 and height 110.
; PLAN: r0=432(x), r1=109(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=113(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x), r11=29(y), r12=85(width), r13=110(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 109
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 92
LDI r6, 113
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 29
LDI r12, 85
LDI r13, 110
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
