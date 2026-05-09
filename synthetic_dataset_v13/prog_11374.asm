; DESCRIPTION: Composite: Renders a orange disk with center (335, 140) and radius 21 then Creates a green rectangular region at (177, 83) spanning 43 by 39 pixels.
; PLAN: r0=335(x), r1=140(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=83(y), r7=43(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 140
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 83
LDI r7, 43
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
