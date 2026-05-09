; DESCRIPTION: Composite: Creates a orange circular shape at (287, 94) with radius 72 then Renders a green box of size 56x58 starting at (19, 122).
; PLAN: r0=287(x), r1=94(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x), r6=122(y), r7=56(width), r8=58(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 94
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 122
LDI r7, 56
LDI r8, 58
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
