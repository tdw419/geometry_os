; DESCRIPTION: Composite: Draws a purple circle centered at (278, 154) with radius 64 then Creates a black rectangular region at (455, 131) spanning 19 by 42 pixels.
; PLAN: r0=278(x), r1=154(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=131(y), r7=19(width), r8=42(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 154
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 131
LDI r7, 19
LDI r8, 42
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
