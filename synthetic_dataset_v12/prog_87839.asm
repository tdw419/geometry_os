; DESCRIPTION: Composite: Renders a cyan disk with center (246, 123) and radius 17 then Creates a green rectangular region at (47, 12) spanning 108 by 66 pixels.
; PLAN: r0=246(x), r1=123(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=12(y), r7=108(width), r8=66(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 123
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 12
LDI r7, 108
LDI r8, 66
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
