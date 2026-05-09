; DESCRIPTION: Composite: Places a blue circle of radius 36 at center (311, 160) then Draws a red rectangle at (376, 85) with width 70 and height 72.
; PLAN: r0=311(x), r1=160(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=85(y), r7=70(width), r8=72(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 160
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 85
LDI r7, 70
LDI r8, 72
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
