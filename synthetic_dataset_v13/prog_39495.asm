; DESCRIPTION: Composite: Draws a green rectangle at (248, 125) with width 118 and height 105 then Places a cyan circle of radius 31 at center (45, 36).
; PLAN: r0=248(x), r1=125(y), r2=118(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x), r6=36(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 125
LDI r2, 118
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 36
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
