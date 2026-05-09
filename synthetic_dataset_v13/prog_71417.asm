; DESCRIPTION: Composite: Places a orange dot at position (220, 47) then Creates a white circular shape at (155, 69) with radius 24 then Draws a red rectangle at (381, 112) with width 85 and height 83.
; PLAN: r0=220(x), r1=47(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=69(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=381(x), r11=112(y), r12=85(width), r13=83(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 47
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 155
LDI r6, 69
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 381
LDI r11, 112
LDI r12, 85
LDI r13, 83
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
