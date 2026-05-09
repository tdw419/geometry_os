; DESCRIPTION: Composite: Renders a yellow box of size 78x19 starting at (179, 200) then Draws a yellow circle centered at (289, 195) with radius 58.
; PLAN: r0=179(x), r1=200(y), r2=78(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=195(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 179
LDI r1, 200
LDI r2, 78
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 195
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
