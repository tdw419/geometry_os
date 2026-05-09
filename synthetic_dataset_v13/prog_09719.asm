; DESCRIPTION: Composite: Sets a single blue pixel at (421, 77) then Creates a green rectangular region at (288, 99) spanning 74 by 74 pixels then Draws a magenta circle centered at (345, 146) with radius 66.
; PLAN: r0=421(x), r1=77(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=99(y), r7=74(width), r8=74(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=345(x), r11=146(y), r12=66(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 421
LDI r1, 77
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 288
LDI r6, 99
LDI r7, 74
LDI r8, 74
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 146
LDI r12, 66
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
