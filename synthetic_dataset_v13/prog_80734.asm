; DESCRIPTION: Composite: Draws a red circle centered at (131, 68) with radius 31 then Draws a white rectangle at (7, 114) with width 16 and height 118.
; PLAN: r0=131(x), r1=68(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=114(y), r7=16(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 68
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 114
LDI r7, 16
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
