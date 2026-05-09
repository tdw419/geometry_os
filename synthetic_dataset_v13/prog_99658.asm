; DESCRIPTION: Composite: Draws a green circle centered at (168, 138) with radius 19 then Sets a single orange pixel at (275, 203) then Draws a magenta rectangle at (192, 10) with width 15 and height 113.
; PLAN: r0=168(x), r1=138(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x), r6=203(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=192(x), r11=10(y), r12=15(width), r13=113(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 138
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 203
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 192
LDI r11, 10
LDI r12, 15
LDI r13, 113
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
