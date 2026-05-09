; DESCRIPTION: Composite: Places a white circle of radius 15 at center (274, 87) then Draws a orange rectangle at (334, 146) with width 16 and height 100.
; PLAN: r0=274(x), r1=87(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=146(y), r7=16(width), r8=100(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 87
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 146
LDI r7, 16
LDI r8, 100
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
