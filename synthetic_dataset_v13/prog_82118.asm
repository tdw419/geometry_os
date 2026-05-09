; DESCRIPTION: Composite: Draws a magenta circle centered at (241, 42) with radius 32 then Places a blue 10x73 rectangle at position (308, 151).
; PLAN: r0=241(x), r1=42(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=151(y), r7=10(width), r8=73(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 42
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 151
LDI r7, 10
LDI r8, 73
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
