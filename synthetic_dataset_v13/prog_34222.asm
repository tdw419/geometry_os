; DESCRIPTION: Composite: Creates a white circular shape at (120, 191) with radius 62 then Renders a orange box of size 28x109 starting at (430, 3).
; PLAN: r0=120(x), r1=191(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=3(y), r7=28(width), r8=109(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 191
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 3
LDI r7, 28
LDI r8, 109
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
