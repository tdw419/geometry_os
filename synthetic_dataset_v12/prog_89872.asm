; DESCRIPTION: Composite: Draws a red rectangle at (20, 100) with width 107 and height 23 then Creates a yellow circular shape at (182, 88) with radius 47 then Places a white dot at position (370, 86).
; PLAN: r0=20(x), r1=100(y), r2=107(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=88(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x), r11=86(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 20
LDI r1, 100
LDI r2, 107
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 88
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 86
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
