; DESCRIPTION: Composite: Places a white 83x36 rectangle at position (420, 43) then Draws a orange circle centered at (431, 42) with radius 19.
; PLAN: r0=420(x), r1=43(y), r2=83(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=42(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 420
LDI r1, 43
LDI r2, 83
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 42
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
