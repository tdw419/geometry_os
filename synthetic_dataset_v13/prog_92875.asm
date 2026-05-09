; DESCRIPTION: Composite: Renders a blue box of size 99x89 starting at (264, 33) then Sets a single yellow pixel at (458, 30) then Draws a magenta circle centered at (37, 49) with radius 14.
; PLAN: r0=264(x), r1=33(y), r2=99(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x), r6=30(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=37(x), r11=49(y), r12=14(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 33
LDI r2, 99
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 30
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 37
LDI r11, 49
LDI r12, 14
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
