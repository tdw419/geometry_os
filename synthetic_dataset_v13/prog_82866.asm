; DESCRIPTION: Composite: Draws a white rectangle at (177, 93) with width 13 and height 71 then Draws a orange circle centered at (310, 188) with radius 19 then Renders a white line between points (360, 224) and (421, 89).
; PLAN: r0=177(x), r1=93(y), r2=13(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=188(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=360(x1), r11=224(y1), r12=421(x2), r13=89(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 93
LDI r2, 13
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 188
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 360
LDI r11, 224
LDI r12, 421
LDI r13, 89
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
