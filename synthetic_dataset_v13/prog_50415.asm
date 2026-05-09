; DESCRIPTION: Composite: Draws a magenta circle centered at (364, 121) with radius 79 then Creates a yellow rectangular region at (107, 137) spanning 49 by 58 pixels.
; PLAN: r0=364(x), r1=121(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=137(y), r7=49(width), r8=58(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 121
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 137
LDI r7, 49
LDI r8, 58
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
