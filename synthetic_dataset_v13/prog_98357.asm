; DESCRIPTION: Composite: Draws a white rectangle at (69, 142) with width 96 and height 51 then Places a orange circle of radius 71 at center (245, 98) then Places a green line segment connecting (1, 189) to (274, 121).
; PLAN: r0=69(x), r1=142(y), r2=96(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=98(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x1), r11=189(y1), r12=274(x2), r13=121(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 142
LDI r2, 96
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 98
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 189
LDI r12, 274
LDI r13, 121
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
