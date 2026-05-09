; DESCRIPTION: Composite: Draws a black rectangle at (17, 33) with width 28 and height 33 then Sets a single blue pixel at (394, 74).
; PLAN: r0=17(x), r1=33(y), r2=28(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x), r6=74(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 17
LDI r1, 33
LDI r2, 28
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 74
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
