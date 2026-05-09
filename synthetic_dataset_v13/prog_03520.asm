; DESCRIPTION: Composite: Draws a orange circle centered at (400, 92) with radius 17 then Places a cyan 20x110 rectangle at position (41, 118).
; PLAN: r0=400(x), r1=92(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=118(y), r7=20(width), r8=110(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 92
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 118
LDI r7, 20
LDI r8, 110
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
