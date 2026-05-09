; DESCRIPTION: Composite: Draws a magenta circle centered at (49, 90) with radius 46 then Renders a orange box of size 48x29 starting at (191, 94) then Sets a single blue pixel at (337, 123).
; PLAN: r0=49(x), r1=90(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x), r6=94(y), r7=48(width), r8=29(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=337(x), r11=123(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 49
LDI r1, 90
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 94
LDI r7, 48
LDI r8, 29
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 123
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
