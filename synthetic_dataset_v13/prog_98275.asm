; DESCRIPTION: Composite: Places a orange circle of radius 19 at center (434, 56) then Draws a cyan rectangle at (343, 156) with width 61 and height 100.
; PLAN: r0=434(x), r1=56(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x), r6=156(y), r7=61(width), r8=100(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 56
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 156
LDI r7, 61
LDI r8, 100
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
