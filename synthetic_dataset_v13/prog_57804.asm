; DESCRIPTION: Composite: Draws a yellow rectangle at (114, 167) with width 85 and height 32 then Renders a magenta disk with center (108, 48) and radius 24.
; PLAN: r0=114(x), r1=167(y), r2=85(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=48(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 167
LDI r2, 85
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 48
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
