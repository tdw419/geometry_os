; DESCRIPTION: Composite: Draws a white circle centered at (175, 144) with radius 60 then Places a black 52x88 rectangle at position (395, 41).
; PLAN: r0=175(x), r1=144(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x), r6=41(y), r7=52(width), r8=88(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 144
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 41
LDI r7, 52
LDI r8, 88
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
