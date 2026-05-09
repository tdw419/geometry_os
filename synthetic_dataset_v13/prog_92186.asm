; DESCRIPTION: Composite: Creates a white circular shape at (163, 105) with radius 15 then Renders a white box of size 27x21 starting at (75, 12).
; PLAN: r0=163(x), r1=105(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=12(y), r7=27(width), r8=21(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 105
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 12
LDI r7, 27
LDI r8, 21
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
