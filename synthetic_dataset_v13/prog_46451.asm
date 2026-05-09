; DESCRIPTION: Composite: Draws a yellow rectangle at (178, 50) with width 99 and height 73 then Renders a magenta disk with center (142, 141) and radius 32.
; PLAN: r0=178(x), r1=50(y), r2=99(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x), r6=141(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 178
LDI r1, 50
LDI r2, 99
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 141
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
