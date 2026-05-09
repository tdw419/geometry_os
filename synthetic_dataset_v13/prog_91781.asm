; DESCRIPTION: Composite: Creates a purple rectangular region at (256, 208) spanning 17 by 24 pixels then Creates a magenta circular shape at (436, 82) with radius 63.
; PLAN: r0=256(x), r1=208(y), r2=17(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=82(y), r7=63(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 256
LDI r1, 208
LDI r2, 17
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 82
LDI r7, 63
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
