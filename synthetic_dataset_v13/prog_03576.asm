; DESCRIPTION: Composite: Draws a magenta circle centered at (242, 181) with radius 20 then Draws a orange rectangle at (116, 148) with width 38 and height 85.
; PLAN: r0=242(x), r1=181(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x), r6=148(y), r7=38(width), r8=85(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 181
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 148
LDI r7, 38
LDI r8, 85
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
