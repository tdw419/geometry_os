; DESCRIPTION: Composite: Places a orange 26x16 rectangle at position (451, 25) then Draws a white circle centered at (228, 170) with radius 35.
; PLAN: r0=451(x), r1=25(y), r2=26(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x), r6=170(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 451
LDI r1, 25
LDI r2, 26
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 170
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
