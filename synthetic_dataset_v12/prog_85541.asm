; DESCRIPTION: Composite: Places a orange 42x82 rectangle at position (422, 164) then Draws a magenta circle centered at (116, 173) with radius 38.
; PLAN: r0=422(x), r1=164(y), r2=42(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=173(y), r7=38(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 164
LDI r2, 42
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 173
LDI r7, 38
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
