; DESCRIPTION: Composite: Renders a magenta disk with center (238, 98) and radius 69 then Draws a white rectangle at (177, 56) with width 74 and height 111.
; PLAN: r0=238(x), r1=98(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=56(y), r7=74(width), r8=111(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 98
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 56
LDI r7, 74
LDI r8, 111
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
