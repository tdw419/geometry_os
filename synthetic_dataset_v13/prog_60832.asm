; DESCRIPTION: Composite: Renders a blue disk with center (268, 83) and radius 18 then Creates a black rectangular region at (37, 170) spanning 63 by 83 pixels.
; PLAN: r0=268(x), r1=83(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=170(y), r7=63(width), r8=83(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 83
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 170
LDI r7, 63
LDI r8, 83
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
