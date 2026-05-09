; DESCRIPTION: Composite: Sets a single blue pixel at (142, 163) then Draws a orange circle centered at (30, 167) with radius 16 then Draws a green rectangle at (192, 152) with width 31 and height 85.
; PLAN: r0=142(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=30(x), r6=167(y), r7=16(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=192(x), r11=152(y), r12=31(width), r13=85(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 163
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 30
LDI r6, 167
LDI r7, 16
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 192
LDI r11, 152
LDI r12, 31
LDI r13, 85
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
