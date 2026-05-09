; DESCRIPTION: Composite: Creates a white circular shape at (50, 211) with radius 34 then Draws a white rectangle at (268, 32) with width 20 and height 66.
; PLAN: r0=50(x), r1=211(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=32(y), r7=20(width), r8=66(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 211
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 32
LDI r7, 20
LDI r8, 66
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
