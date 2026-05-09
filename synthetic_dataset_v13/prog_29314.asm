; DESCRIPTION: Composite: Draws a magenta rectangle at (363, 103) with width 110 and height 22 then Places a white circle of radius 41 at center (287, 90).
; PLAN: r0=363(x), r1=103(y), r2=110(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x), r6=90(y), r7=41(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 103
LDI r2, 110
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 90
LDI r7, 41
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
