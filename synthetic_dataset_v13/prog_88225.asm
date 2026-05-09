; DESCRIPTION: Composite: Draws a purple circle centered at (421, 139) with radius 76 then Renders a cyan box of size 45x46 starting at (441, 96).
; PLAN: r0=421(x), r1=139(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x), r6=96(y), r7=45(width), r8=46(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 139
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 96
LDI r7, 45
LDI r8, 46
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
