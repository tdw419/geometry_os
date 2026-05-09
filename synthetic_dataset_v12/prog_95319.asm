; DESCRIPTION: Composite: Draws a orange circle centered at (344, 137) with radius 48 then Creates a purple rectangular region at (209, 156) spanning 50 by 27 pixels.
; PLAN: r0=344(x), r1=137(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x), r6=156(y), r7=50(width), r8=27(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 137
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 156
LDI r7, 50
LDI r8, 27
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
