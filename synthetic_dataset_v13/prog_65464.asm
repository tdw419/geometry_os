; DESCRIPTION: Composite: Draws a orange rectangle at (77, 71) with width 70 and height 95 then Draws a magenta circle centered at (172, 62) with radius 61.
; PLAN: r0=77(x), r1=71(y), r2=70(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=62(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 77
LDI r1, 71
LDI r2, 70
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 62
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
