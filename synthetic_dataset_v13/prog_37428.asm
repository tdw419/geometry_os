; DESCRIPTION: Composite: Creates a green rectangular region at (176, 80) spanning 12 by 51 pixels then Draws a magenta circle centered at (370, 175) with radius 70.
; PLAN: r0=176(x), r1=80(y), r2=12(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=175(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 176
LDI r1, 80
LDI r2, 12
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 175
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
