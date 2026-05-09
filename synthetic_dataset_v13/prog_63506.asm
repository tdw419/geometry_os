; DESCRIPTION: Composite: Renders a white disk with center (295, 108) and radius 55 then Draws a yellow rectangle at (69, 102) with width 96 and height 110 then Places a black dot at position (50, 113).
; PLAN: r0=295(x), r1=108(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=102(y), r7=96(width), r8=110(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=50(x), r11=113(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 295
LDI r1, 108
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 102
LDI r7, 96
LDI r8, 110
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 113
LDI r12, 0x000000
PSET r10, r11, r12
HALT
