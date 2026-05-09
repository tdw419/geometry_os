; DESCRIPTION: Composite: Renders a white box of size 77x62 starting at (375, 140) then Draws a white circle centered at (255, 128) with radius 38 then Places a orange dot at position (431, 137).
; PLAN: r0=375(x), r1=140(y), r2=77(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=128(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=431(x), r11=137(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 375
LDI r1, 140
LDI r2, 77
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 128
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 431
LDI r11, 137
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
