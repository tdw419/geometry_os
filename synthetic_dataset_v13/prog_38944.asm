; DESCRIPTION: Composite: Renders a white box of size 18x96 starting at (202, 135) then Draws a orange circle centered at (127, 166) with radius 71 then Sets a single blue pixel at (212, 199).
; PLAN: r0=202(x), r1=135(y), r2=18(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=166(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=212(x), r11=199(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 202
LDI r1, 135
LDI r2, 18
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 166
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 212
LDI r11, 199
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
