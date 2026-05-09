; DESCRIPTION: Composite: Draws a white circle centered at (172, 113) with radius 78 then Renders a magenta box of size 83x107 starting at (293, 92) then Draws a black line from (491, 165) to (341, 184).
; PLAN: r0=172(x), r1=113(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x), r6=92(y), r7=83(width), r8=107(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=491(x1), r11=165(y1), r12=341(x2), r13=184(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 113
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 92
LDI r7, 83
LDI r8, 107
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 491
LDI r11, 165
LDI r12, 341
LDI r13, 184
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
