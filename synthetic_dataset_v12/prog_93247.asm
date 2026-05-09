; DESCRIPTION: Composite: Draws a green rectangle at (122, 105) with width 105 and height 61 then Places a white circle of radius 39 at center (443, 44).
; PLAN: r0=122(x), r1=105(y), r2=105(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x), r6=44(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 122
LDI r1, 105
LDI r2, 105
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 44
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
