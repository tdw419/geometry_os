; DESCRIPTION: Composite: Draws a orange rectangle at (112, 2) with width 36 and height 93 then Draws a white circle centered at (380, 29) with radius 17.
; PLAN: r0=112(x), r1=2(y), r2=36(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x), r6=29(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 112
LDI r1, 2
LDI r2, 36
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 29
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
