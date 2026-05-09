; DESCRIPTION: Composite: Creates a magenta circular shape at (287, 172) with radius 75 then Draws a orange rectangle at (40, 89) with width 32 and height 115.
; PLAN: r0=287(x), r1=172(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=89(y), r7=32(width), r8=115(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 172
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 89
LDI r7, 32
LDI r8, 115
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
