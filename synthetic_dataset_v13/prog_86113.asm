; DESCRIPTION: Composite: Draws a white rectangle at (282, 154) with width 57 and height 46 then Renders a black disk with center (134, 161) and radius 50.
; PLAN: r0=282(x), r1=154(y), r2=57(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=134(x), r6=161(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 282
LDI r1, 154
LDI r2, 57
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 161
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
