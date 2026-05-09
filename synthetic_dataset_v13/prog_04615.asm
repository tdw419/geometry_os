; DESCRIPTION: Composite: Places a orange dot at position (426, 126) then Renders a white disk with center (135, 152) and radius 66 then Creates a blue rectangular region at (72, 156) spanning 69 by 45 pixels.
; PLAN: r0=426(x), r1=126(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=135(x), r6=152(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x), r11=156(y), r12=69(width), r13=45(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 126
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 135
LDI r6, 152
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 156
LDI r12, 69
LDI r13, 45
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
