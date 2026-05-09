; DESCRIPTION: Composite: Renders a yellow box of size 78x113 starting at (294, 100) then Draws a cyan circle centered at (355, 102) with radius 18 then Sets a single purple pixel at (361, 163).
; PLAN: r0=294(x), r1=100(y), r2=78(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=102(y), r7=18(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=361(x), r11=163(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 100
LDI r2, 78
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 102
LDI r7, 18
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 361
LDI r11, 163
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
