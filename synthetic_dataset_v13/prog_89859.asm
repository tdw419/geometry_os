; DESCRIPTION: Composite: Draws a magenta rectangle at (75, 36) with width 80 and height 117 then Renders a magenta disk with center (21, 115) and radius 15 then Sets a single white pixel at (30, 137).
; PLAN: r0=75(x), r1=36(y), r2=80(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x), r6=115(y), r7=15(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=30(x), r11=137(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 75
LDI r1, 36
LDI r2, 80
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 115
LDI r7, 15
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 30
LDI r11, 137
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
