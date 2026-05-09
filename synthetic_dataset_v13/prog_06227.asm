; DESCRIPTION: Composite: Draws a magenta rectangle at (449, 155) with width 42 and height 77 then Places a orange circle of radius 71 at center (91, 136).
; PLAN: r0=449(x), r1=155(y), r2=42(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x), r6=136(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 449
LDI r1, 155
LDI r2, 42
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 136
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
