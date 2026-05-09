; DESCRIPTION: Composite: Places a magenta dot at position (20, 147) then Draws a blue rectangle at (285, 115) with width 81 and height 116 then Creates a blue circular shape at (379, 172) with radius 28.
; PLAN: r0=20(x), r1=147(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=115(y), r7=81(width), r8=116(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x), r11=172(y), r12=28(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 20
LDI r1, 147
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 285
LDI r6, 115
LDI r7, 81
LDI r8, 116
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 172
LDI r12, 28
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
