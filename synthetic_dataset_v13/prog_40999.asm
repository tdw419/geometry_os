; DESCRIPTION: Composite: Renders a white disk with center (387, 113) and radius 74 then Sets a single yellow pixel at (33, 167) then Draws a black rectangle at (9, 90) with width 116 and height 21.
; PLAN: r0=387(x), r1=113(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=167(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=9(x), r11=90(y), r12=116(width), r13=21(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 113
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 167
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 9
LDI r11, 90
LDI r12, 116
LDI r13, 21
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
