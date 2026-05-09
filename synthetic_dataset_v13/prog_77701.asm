; DESCRIPTION: Composite: Creates a red rectangular region at (288, 26) spanning 56 by 13 pixels then Draws a green circle centered at (303, 175) with radius 31 then Places a yellow dot at position (68, 74).
; PLAN: r0=288(x), r1=26(y), r2=56(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=175(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=74(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 288
LDI r1, 26
LDI r2, 56
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 175
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 74
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
