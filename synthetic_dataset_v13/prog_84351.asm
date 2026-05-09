; DESCRIPTION: Composite: Renders a orange disk with center (30, 28) and radius 11 then Draws a blue rectangle at (320, 131) with width 108 and height 89 then Places a red dot at position (68, 88).
; PLAN: r0=30(x), r1=28(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x), r6=131(y), r7=108(width), r8=89(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=88(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 30
LDI r1, 28
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 131
LDI r7, 108
LDI r8, 89
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 88
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
