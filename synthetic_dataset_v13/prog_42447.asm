; DESCRIPTION: Composite: Draws a magenta circle centered at (408, 73) with radius 68 then Places a black 30x99 rectangle at position (184, 49).
; PLAN: r0=408(x), r1=73(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=49(y), r7=30(width), r8=99(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 73
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 49
LDI r7, 30
LDI r8, 99
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
