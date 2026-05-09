; DESCRIPTION: Composite: Renders a orange box of size 11x100 starting at (370, 23) then Creates a blue circular shape at (122, 176) with radius 36.
; PLAN: r0=370(x), r1=23(y), r2=11(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=176(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 370
LDI r1, 23
LDI r2, 11
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 176
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
