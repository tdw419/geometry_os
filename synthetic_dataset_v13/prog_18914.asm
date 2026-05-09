; DESCRIPTION: Composite: Draws a red rectangle at (328, 142) with width 66 and height 81 then Draws a red circle centered at (358, 165) with radius 71.
; PLAN: r0=328(x), r1=142(y), r2=66(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=165(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 142
LDI r2, 66
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 165
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
