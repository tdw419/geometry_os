; DESCRIPTION: Composite: Draws a magenta circle centered at (175, 120) with radius 71 then Places a white dot at position (278, 69) then Renders a yellow box of size 113x119 starting at (348, 27).
; PLAN: r0=175(x), r1=120(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=69(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=348(x), r11=27(y), r12=113(width), r13=119(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 175
LDI r1, 120
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 69
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 348
LDI r11, 27
LDI r12, 113
LDI r13, 119
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
