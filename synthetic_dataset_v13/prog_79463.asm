; DESCRIPTION: Composite: Draws a magenta circle centered at (371, 142) with radius 78 then Draws a red rectangle at (274, 112) with width 22 and height 92.
; PLAN: r0=371(x), r1=142(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x), r6=112(y), r7=22(width), r8=92(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 142
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 112
LDI r7, 22
LDI r8, 92
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
