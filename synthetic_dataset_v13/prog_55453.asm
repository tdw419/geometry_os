; DESCRIPTION: Composite: Places a black dot at position (230, 13) then Creates a red rectangular region at (89, 132) spanning 38 by 88 pixels then Draws a green circle centered at (463, 130) with radius 30.
; PLAN: r0=230(x), r1=13(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=132(y), r7=38(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=463(x), r11=130(y), r12=30(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 230
LDI r1, 13
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 89
LDI r6, 132
LDI r7, 38
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 130
LDI r12, 30
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
