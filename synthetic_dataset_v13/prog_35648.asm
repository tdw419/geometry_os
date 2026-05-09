; DESCRIPTION: Composite: Sets a single magenta pixel at (463, 135) then Draws a magenta rectangle at (75, 23) with width 47 and height 28 then Creates a black circular shape at (282, 152) with radius 67.
; PLAN: r0=463(x), r1=135(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=23(y), r7=47(width), r8=28(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=282(x), r11=152(y), r12=67(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 463
LDI r1, 135
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 75
LDI r6, 23
LDI r7, 47
LDI r8, 28
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 152
LDI r12, 67
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
