; DESCRIPTION: Composite: Renders a magenta disk with center (102, 121) and radius 76 then Places a green dot at position (96, 5) then Draws a cyan rectangle at (69, 105) with width 16 and height 119.
; PLAN: r0=102(x), r1=121(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=5(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=69(x), r11=105(y), r12=16(width), r13=119(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 121
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 5
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 69
LDI r11, 105
LDI r12, 16
LDI r13, 119
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
