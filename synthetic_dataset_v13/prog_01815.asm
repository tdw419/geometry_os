; DESCRIPTION: Composite: Draws a black rectangle at (318, 218) with width 11 and height 31 then Places a red circle of radius 39 at center (130, 108).
; PLAN: r0=318(x), r1=218(y), r2=11(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=108(y), r7=39(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 318
LDI r1, 218
LDI r2, 11
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 108
LDI r7, 39
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
