; DESCRIPTION: Composite: Renders a red disk with center (154, 43) and radius 26 then Draws a blue rectangle at (403, 102) with width 22 and height 95 then Places a orange dot at position (485, 189).
; PLAN: r0=154(x), r1=43(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x), r6=102(y), r7=22(width), r8=95(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=485(x), r11=189(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 154
LDI r1, 43
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 102
LDI r7, 22
LDI r8, 95
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 485
LDI r11, 189
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
