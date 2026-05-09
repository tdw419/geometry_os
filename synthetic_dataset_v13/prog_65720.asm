; DESCRIPTION: Composite: Places a orange circle of radius 40 at center (455, 126) then Draws a blue rectangle at (299, 42) with width 12 and height 39.
; PLAN: r0=455(x), r1=126(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x), r6=42(y), r7=12(width), r8=39(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 126
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 42
LDI r7, 12
LDI r8, 39
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
