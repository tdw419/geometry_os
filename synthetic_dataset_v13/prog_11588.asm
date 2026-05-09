; DESCRIPTION: Composite: Draws a green circle centered at (156, 138) with radius 78 then Places a cyan 29x82 rectangle at position (69, 30).
; PLAN: r0=156(x), r1=138(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=30(y), r7=29(width), r8=82(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 138
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 30
LDI r7, 29
LDI r8, 82
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
