; DESCRIPTION: Composite: Draws a red circle centered at (390, 171) with radius 20 then Places a cyan dot at position (70, 68) then Draws a blue rectangle at (154, 130) with width 112 and height 88.
; PLAN: r0=390(x), r1=171(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=68(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=154(x), r11=130(y), r12=112(width), r13=88(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 171
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 68
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 154
LDI r11, 130
LDI r12, 112
LDI r13, 88
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
