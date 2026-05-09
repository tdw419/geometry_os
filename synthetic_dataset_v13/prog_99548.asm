; DESCRIPTION: Composite: Places a black dot at position (253, 69) then Renders a white disk with center (364, 100) and radius 13 then Draws a green rectangle at (0, 170) with width 70 and height 82.
; PLAN: r0=253(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=100(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=0(x), r11=170(y), r12=70(width), r13=82(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 364
LDI r6, 100
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 0
LDI r11, 170
LDI r12, 70
LDI r13, 82
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
