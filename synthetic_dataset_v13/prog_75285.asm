; DESCRIPTION: Composite: Draws a red rectangle at (114, 150) with width 45 and height 70 then Sets a single orange pixel at (28, 176) then Creates a blue circular shape at (96, 77) with radius 73.
; PLAN: r0=114(x), r1=150(y), r2=45(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=28(x), r6=176(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=96(x), r11=77(y), r12=73(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 114
LDI r1, 150
LDI r2, 45
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 176
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 96
LDI r11, 77
LDI r12, 73
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
