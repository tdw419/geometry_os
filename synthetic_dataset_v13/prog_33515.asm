; DESCRIPTION: Composite: Sets a single red pixel at (3, 156) then Draws a white circle centered at (65, 161) with radius 10 then Draws a magenta rectangle at (290, 88) with width 85 and height 66.
; PLAN: r0=3(x), r1=156(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=161(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=290(x), r11=88(y), r12=85(width), r13=66(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 3
LDI r1, 156
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 65
LDI r6, 161
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 290
LDI r11, 88
LDI r12, 85
LDI r13, 66
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
