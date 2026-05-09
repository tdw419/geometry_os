; DESCRIPTION: Composite: Draws a purple rectangle at (310, 180) with width 117 and height 60 then Creates a red circular shape at (441, 114) with radius 67 then Places a magenta dot at position (360, 63).
; PLAN: r0=310(x), r1=180(y), r2=117(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=114(y), r7=67(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=360(x), r11=63(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 310
LDI r1, 180
LDI r2, 117
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 114
LDI r7, 67
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 360
LDI r11, 63
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
