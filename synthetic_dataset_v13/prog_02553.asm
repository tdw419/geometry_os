; DESCRIPTION: Composite: Renders a magenta box of size 56x62 starting at (200, 97) then Places a purple dot at position (441, 186) then Draws a magenta circle centered at (384, 175) with radius 66.
; PLAN: r0=200(x), r1=97(y), r2=56(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=186(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=384(x), r11=175(y), r12=66(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 200
LDI r1, 97
LDI r2, 56
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 186
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 384
LDI r11, 175
LDI r12, 66
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
