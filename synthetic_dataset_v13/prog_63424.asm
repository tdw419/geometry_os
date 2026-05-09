; DESCRIPTION: Composite: Draws a magenta rectangle at (56, 199) with width 47 and height 56 then Sets a single white pixel at (299, 224) then Renders a magenta disk with center (257, 50) and radius 36.
; PLAN: r0=56(x), r1=199(y), r2=47(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=224(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=257(x), r11=50(y), r12=36(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 56
LDI r1, 199
LDI r2, 47
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 224
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 257
LDI r11, 50
LDI r12, 36
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
