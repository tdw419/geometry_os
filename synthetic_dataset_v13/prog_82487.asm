; DESCRIPTION: Composite: Creates a yellow circular shape at (65, 154) with radius 38 then Draws a blue rectangle at (416, 49) with width 74 and height 58 then Places a blue dot at position (256, 170).
; PLAN: r0=65(x), r1=154(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x), r6=49(y), r7=74(width), r8=58(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x), r11=170(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 65
LDI r1, 154
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 49
LDI r7, 74
LDI r8, 58
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 170
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
