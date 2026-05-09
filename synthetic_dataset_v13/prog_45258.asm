; DESCRIPTION: Composite: Places a cyan 64x75 rectangle at position (359, 82) then Creates a magenta circular shape at (183, 166) with radius 30.
; PLAN: r0=359(x), r1=82(y), r2=64(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=166(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 359
LDI r1, 82
LDI r2, 64
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 166
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
