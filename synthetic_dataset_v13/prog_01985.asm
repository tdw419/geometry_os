; DESCRIPTION: Composite: Places a magenta 48x101 rectangle at position (374, 128) then Draws a orange circle centered at (230, 165) with radius 79.
; PLAN: r0=374(x), r1=128(y), r2=48(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=165(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 374
LDI r1, 128
LDI r2, 48
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 165
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
