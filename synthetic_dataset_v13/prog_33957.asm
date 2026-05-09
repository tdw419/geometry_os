; DESCRIPTION: Composite: Creates a red circular shape at (369, 69) with radius 46 then Draws a black rectangle at (359, 116) with width 22 and height 78 then Sets a single purple pixel at (30, 44).
; PLAN: r0=369(x), r1=69(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x), r6=116(y), r7=22(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=30(x), r11=44(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 369
LDI r1, 69
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 116
LDI r7, 22
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 44
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
