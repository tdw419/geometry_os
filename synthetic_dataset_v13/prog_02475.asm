; DESCRIPTION: Composite: Sets a single blue pixel at (455, 135) then Draws a yellow rectangle at (226, 158) with width 115 and height 15 then Creates a green circular shape at (249, 57) with radius 53.
; PLAN: r0=455(x), r1=135(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=158(y), r7=115(width), r8=15(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=249(x), r11=57(y), r12=53(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 455
LDI r1, 135
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 226
LDI r6, 158
LDI r7, 115
LDI r8, 15
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 57
LDI r12, 53
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
