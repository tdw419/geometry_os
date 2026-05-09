; DESCRIPTION: Composite: Draws a black rectangle at (21, 181) with width 115 and height 41 then Renders a white disk with center (145, 181) and radius 57.
; PLAN: r0=21(x), r1=181(y), r2=115(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=181(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 181
LDI r2, 115
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 181
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
