; DESCRIPTION: Composite: Creates a white circular shape at (82, 148) with radius 23 then Renders a orange box of size 37x24 starting at (50, 19).
; PLAN: r0=82(x), r1=148(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x), r6=19(y), r7=37(width), r8=24(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 148
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 19
LDI r7, 37
LDI r8, 24
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
