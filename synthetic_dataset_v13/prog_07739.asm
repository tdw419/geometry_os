; DESCRIPTION: Composite: Renders a cyan box of size 90x28 starting at (238, 145) then Sets a single cyan pixel at (90, 156) then Draws a magenta circle centered at (254, 102) with radius 20.
; PLAN: r0=238(x), r1=145(y), r2=90(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x), r6=156(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=254(x), r11=102(y), r12=20(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 238
LDI r1, 145
LDI r2, 90
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 156
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 254
LDI r11, 102
LDI r12, 20
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
