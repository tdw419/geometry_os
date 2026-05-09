; DESCRIPTION: Composite: Creates a cyan circular shape at (311, 141) with radius 61 then Draws a blue rectangle at (139, 173) with width 91 and height 74.
; PLAN: r0=311(x), r1=141(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=173(y), r7=91(width), r8=74(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 141
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 173
LDI r7, 91
LDI r8, 74
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
