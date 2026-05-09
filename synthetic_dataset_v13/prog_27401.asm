; DESCRIPTION: Composite: Draws a magenta circle centered at (95, 216) with radius 12 then Creates a green rectangular region at (319, 96) spanning 62 by 87 pixels.
; PLAN: r0=95(x), r1=216(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x), r6=96(y), r7=62(width), r8=87(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 216
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 96
LDI r7, 62
LDI r8, 87
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
