; DESCRIPTION: Composite: Creates a green circular shape at (244, 143) with radius 80 then Renders a orange box of size 24x67 starting at (375, 135).
; PLAN: r0=244(x), r1=143(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=135(y), r7=24(width), r8=67(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 143
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 135
LDI r7, 24
LDI r8, 67
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
