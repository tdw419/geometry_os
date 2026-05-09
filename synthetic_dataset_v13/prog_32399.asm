; DESCRIPTION: Composite: Draws a black circle centered at (202, 94) with radius 55 then Draws a purple rectangle at (111, 33) with width 88 and height 71.
; PLAN: r0=202(x), r1=94(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=33(y), r7=88(width), r8=71(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 94
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 33
LDI r7, 88
LDI r8, 71
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
