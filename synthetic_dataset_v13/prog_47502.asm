; DESCRIPTION: Composite: Places a purple dot at position (462, 154) then Draws a magenta rectangle at (294, 165) with width 70 and height 76.
; PLAN: r0=462(x), r1=154(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=294(x), r6=165(y), r7=70(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 154
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 294
LDI r6, 165
LDI r7, 70
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
