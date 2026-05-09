; DESCRIPTION: Composite: Draws a blue rectangle at (96, 103) with width 72 and height 80 then Draws a red circle centered at (194, 22) with radius 17 then Sets a single orange pixel at (21, 202).
; PLAN: r0=96(x), r1=103(y), r2=72(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=22(y), r7=17(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=21(x), r11=202(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 103
LDI r2, 72
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 22
LDI r7, 17
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 21
LDI r11, 202
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
