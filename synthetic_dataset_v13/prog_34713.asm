; DESCRIPTION: Composite: Places a green dot at position (36, 175) then Draws a purple circle centered at (66, 141) with radius 27 then Draws a green rectangle at (16, 18) with width 34 and height 87.
; PLAN: r0=36(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=141(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=16(x), r11=18(y), r12=34(width), r13=87(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 175
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 66
LDI r6, 141
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 16
LDI r11, 18
LDI r12, 34
LDI r13, 87
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
