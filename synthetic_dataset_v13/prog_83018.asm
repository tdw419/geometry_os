; DESCRIPTION: Composite: Creates a white circular shape at (366, 216) with radius 30 then Draws a cyan rectangle at (88, 125) with width 83 and height 113.
; PLAN: r0=366(x), r1=216(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x), r6=125(y), r7=83(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 216
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 125
LDI r7, 83
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
