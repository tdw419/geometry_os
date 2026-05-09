; DESCRIPTION: Composite: Renders a cyan disk with center (376, 213) and radius 36 then Draws a magenta rectangle at (11, 90) with width 69 and height 76.
; PLAN: r0=376(x), r1=213(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=90(y), r7=69(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 213
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 90
LDI r7, 69
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
