; DESCRIPTION: Composite: Places a blue dot at position (360, 33) then Renders a magenta disk with center (161, 192) and radius 50 then Draws a orange rectangle at (84, 18) with width 71 and height 28.
; PLAN: r0=360(x), r1=33(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=161(x), r6=192(y), r7=50(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=84(x), r11=18(y), r12=71(width), r13=28(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 33
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 161
LDI r6, 192
LDI r7, 50
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 84
LDI r11, 18
LDI r12, 71
LDI r13, 28
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
