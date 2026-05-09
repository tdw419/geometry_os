; DESCRIPTION: Composite: Draws a magenta rectangle at (150, 30) with width 40 and height 78 then Places a cyan circle of radius 75 at center (414, 111).
; PLAN: r0=150(x), r1=30(y), r2=40(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x), r6=111(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 150
LDI r1, 30
LDI r2, 40
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 111
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
