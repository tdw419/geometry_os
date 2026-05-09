; DESCRIPTION: Composite: Draws a magenta rectangle at (152, 76) with width 52 and height 24 then Draws a magenta circle centered at (367, 118) with radius 60 then Sets a single magenta pixel at (312, 255).
; PLAN: r0=152(x), r1=76(y), r2=52(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x), r6=118(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=312(x), r11=255(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 152
LDI r1, 76
LDI r2, 52
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 118
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 312
LDI r11, 255
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
