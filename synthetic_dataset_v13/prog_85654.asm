; DESCRIPTION: Composite: Creates a yellow circular shape at (196, 108) with radius 67 then Draws a white rectangle at (100, 77) with width 120 and height 14 then Places a orange dot at position (473, 120).
; PLAN: r0=196(x), r1=108(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x), r6=77(y), r7=120(width), r8=14(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=473(x), r11=120(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 196
LDI r1, 108
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 77
LDI r7, 120
LDI r8, 14
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 473
LDI r11, 120
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
