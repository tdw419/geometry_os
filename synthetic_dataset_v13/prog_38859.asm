; DESCRIPTION: Composite: Draws a green circle centered at (154, 103) with radius 14 then Draws a green rectangle at (51, 172) with width 91 and height 81.
; PLAN: r0=154(x), r1=103(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x), r6=172(y), r7=91(width), r8=81(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 103
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 172
LDI r7, 91
LDI r8, 81
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
