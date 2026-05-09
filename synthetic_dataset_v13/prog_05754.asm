; DESCRIPTION: Composite: Draws a red circle centered at (394, 184) with radius 58 then Renders a white box of size 108x85 starting at (122, 75).
; PLAN: r0=394(x), r1=184(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=75(y), r7=108(width), r8=85(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 184
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 75
LDI r7, 108
LDI r8, 85
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
