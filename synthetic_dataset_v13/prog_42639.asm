; DESCRIPTION: Composite: Renders a black disk with center (281, 163) and radius 79 then Draws a white rectangle at (149, 167) with width 112 and height 62.
; PLAN: r0=281(x), r1=163(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x), r6=167(y), r7=112(width), r8=62(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 163
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 167
LDI r7, 112
LDI r8, 62
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
