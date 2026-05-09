; DESCRIPTION: Composite: Places a green dot at position (14, 241) then Draws a white circle centered at (382, 169) with radius 79 then Draws a red rectangle at (371, 5) with width 110 and height 88.
; PLAN: r0=14(x), r1=241(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=169(y), r7=79(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=371(x), r11=5(y), r12=110(width), r13=88(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 241
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 382
LDI r6, 169
LDI r7, 79
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 371
LDI r11, 5
LDI r12, 110
LDI r13, 88
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
