; DESCRIPTION: Composite: Draws a cyan circle centered at (211, 141) with radius 15 then Places a magenta 86x15 rectangle at position (65, 148).
; PLAN: r0=211(x), r1=141(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x), r6=148(y), r7=86(width), r8=15(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 141
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 148
LDI r7, 86
LDI r8, 15
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
