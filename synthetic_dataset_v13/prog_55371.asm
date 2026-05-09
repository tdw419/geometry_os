; DESCRIPTION: Composite: Draws a magenta rectangle at (167, 100) with width 119 and height 64 then Renders a orange disk with center (74, 69) and radius 47.
; PLAN: r0=167(x), r1=100(y), r2=119(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x), r6=69(y), r7=47(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 167
LDI r1, 100
LDI r2, 119
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 69
LDI r7, 47
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
