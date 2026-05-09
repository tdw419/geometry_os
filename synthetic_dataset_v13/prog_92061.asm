; DESCRIPTION: Composite: Renders a yellow box of size 11x44 starting at (55, 139) then Draws a black circle centered at (185, 82) with radius 31.
; PLAN: r0=55(x), r1=139(y), r2=11(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x), r6=82(y), r7=31(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 55
LDI r1, 139
LDI r2, 11
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 82
LDI r7, 31
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
