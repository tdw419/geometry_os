; DESCRIPTION: Composite: Places a magenta 102x28 rectangle at position (225, 23) then Draws a orange circle centered at (206, 52) with radius 30.
; PLAN: r0=225(x), r1=23(y), r2=102(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=52(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 225
LDI r1, 23
LDI r2, 102
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 52
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
