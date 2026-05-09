; DESCRIPTION: Composite: Draws a blue rectangle at (75, 114) with width 116 and height 107 then Places a magenta circle of radius 70 at center (237, 145).
; PLAN: r0=75(x), r1=114(y), r2=116(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=145(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 75
LDI r1, 114
LDI r2, 116
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 145
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
