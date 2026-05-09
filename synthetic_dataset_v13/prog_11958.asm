; DESCRIPTION: Composite: Draws a orange rectangle at (180, 60) with width 104 and height 26 then Creates a red circular shape at (49, 187) with radius 30.
; PLAN: r0=180(x), r1=60(y), r2=104(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=187(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 60
LDI r2, 104
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 187
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
