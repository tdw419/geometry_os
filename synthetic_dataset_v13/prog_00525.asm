; DESCRIPTION: Composite: Draws a green rectangle at (127, 87) with width 38 and height 75 then Draws a white circle centered at (394, 175) with radius 76.
; PLAN: r0=127(x), r1=87(y), r2=38(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x), r6=175(y), r7=76(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 127
LDI r1, 87
LDI r2, 38
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 175
LDI r7, 76
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
