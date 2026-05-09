; DESCRIPTION: Composite: Sets a single blue pixel at (449, 165) then Draws a blue rectangle at (457, 69) with width 12 and height 43 then Places a white circle of radius 14 at center (310, 33).
; PLAN: r0=449(x), r1=165(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=457(x), r6=69(y), r7=12(width), r8=43(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=310(x), r11=33(y), r12=14(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 449
LDI r1, 165
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 457
LDI r6, 69
LDI r7, 12
LDI r8, 43
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 33
LDI r12, 14
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
